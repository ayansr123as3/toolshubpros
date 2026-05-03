$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = if ($args.Count -gt 0) { [int]$args[0] } else { 4173 }
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "ToolsHub Pro is running at http://localhost:$port/"

$mime = @{
  ".html" = "text/html; charset=utf-8"
  ".css" = "text/css; charset=utf-8"
  ".js" = "application/javascript; charset=utf-8"
  ".svg" = "image/svg+xml"
  ".xml" = "application/xml; charset=utf-8"
  ".txt" = "text/plain; charset=utf-8"
}

while ($listener.IsListening) {
  $context = $listener.GetContext()
  try {
    $path = [Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart("/"))
    if ([string]::IsNullOrWhiteSpace($path)) { $path = "index.html" }
    $path = $path -replace "/", "\"
    $candidate = [System.IO.Path]::GetFullPath((Join-Path $root $path))
    if (!$candidate.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase)) {
      $context.Response.StatusCode = 403
      $bytes = [Text.Encoding]::UTF8.GetBytes("Forbidden")
    } else {
      if ((Test-Path $candidate -PathType Container)) { $candidate = Join-Path $candidate "index.html" }
      if (Test-Path $candidate -PathType Leaf) {
        $bytes = [System.IO.File]::ReadAllBytes($candidate)
        $ext = [System.IO.Path]::GetExtension($candidate).ToLowerInvariant()
        $context.Response.ContentType = if ($mime.ContainsKey($ext)) { $mime[$ext] } else { "application/octet-stream" }
        $context.Response.StatusCode = 200
      } else {
        $context.Response.StatusCode = 404
        $bytes = [Text.Encoding]::UTF8.GetBytes("Not found")
      }
    }
    $context.Response.ContentLength64 = $bytes.Length
    $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } finally {
    $context.Response.OutputStream.Close()
  }
}
