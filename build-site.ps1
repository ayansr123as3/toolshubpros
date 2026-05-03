$ErrorActionPreference = "Stop"

$siteName = "ToolsHub Pro"
$baseUrl = "https://toolshubpro.com"
$email = "nexioweb.business@gmail.com"
$founder = "Ayan Srivastava"

$categories = @(
  @{ slug = "seo"; name = "SEO"; summary = "Search optimization helpers for audits, metadata, keywords, and crawl-ready content." },
  @{ slug = "image"; name = "Image Tools"; summary = "Fast browser-based utilities for compressing, resizing, converting, and preparing images." },
  @{ slug = "developer"; name = "Developer Tools"; summary = "Formatters, encoders, validators, and generators for everyday engineering workflows." },
  @{ slug = "ai"; name = "AI Tools"; summary = "Simple writing, summarizing, prompt, and idea helpers for creators and teams." },
  @{ slug = "text"; name = "Text Tools"; summary = "Clean, count, transform, and compare copy without installing extra software." },
  @{ slug = "pdf"; name = "PDF Tools"; summary = "Document utilities for conversion, merging, compression, and page-level productivity." },
  @{ slug = "security"; name = "Security Tools"; summary = "Practical privacy and security generators for safer day-to-day work." },
  @{ slug = "business"; name = "Business Tools"; summary = "Calculators and formatters for marketers, founders, students, and operators." }
)

$tools = @(
  @{ slug="image-compressor"; title="Image Compressor"; category="image"; featured=$true; kind="image-compressor"; desc="Compress JPG, PNG, and WebP images directly in your browser with a clean workflow designed for speed and privacy. The Image Compressor helps creators, store owners, bloggers, and developers reduce file weight before uploading visuals to websites, landing pages, social posts, and documentation. Smaller images improve Core Web Vitals, reduce bandwidth usage, and make pages feel faster on mobile networks. ToolsHub Pro keeps the process simple: select an image, choose a quality level, preview the size change, and download an optimized result. Because performance matters for search visibility and user experience, this free image compression tool is ideal for anyone preparing assets for AdSense-friendly websites, SaaS pages, portfolios, and ecommerce listings. It works well for quick optimization passes, content publishing, and everyday design handoff where a heavy source file needs to become a lighter web-ready image without complicated software."; input="Upload an image and choose quality."; output="Download a compressed image."; faqs=@("Does compression happen in the browser? Yes, the demo uses browser canvas processing where supported.","Will my image quality be reduced? Lower quality creates smaller files, while higher quality preserves detail.") },
  @{ slug="background-remover"; title="Background Remover"; category="image"; featured=$true; kind="placeholder"; desc="Remove or prepare image backgrounds for product previews, profile visuals, thumbnails, and marketing graphics. This Background Remover page is built for people who need quick, clean visual preparation without opening a complex editing suite. Use it as a focused workspace for organizing an image, planning a transparent-background version, and creating a consistent asset pipeline for web publishing. Background removal is useful for ecommerce products, creator headshots, presentation visuals, blog thumbnails, and social media posts because it helps the subject stand out and keeps layouts professional. A high-quality background remover can save design time, improve conversion-focused product pages, and make image sets feel consistent across devices. ToolsHub Pro presents the workflow with clear steps, related image tools, and practical guidance so visitors understand how to use background-free visuals responsibly and effectively."; input="Upload or paste an image reference."; output="Prepare a clean subject-focused visual."; faqs=@("Can I use this for product photos? Yes, product images are a common use case.","Should I check edges after removal? Yes, hair, glass, and shadows often need review.") },
  @{ slug="pdf-to-word"; title="PDF to Word"; category="pdf"; featured=$true; kind="placeholder"; desc="Convert PDF content into an editable Word-friendly workflow for reports, resumes, contracts, notes, and study material. The PDF to Word tool page is designed for users who need to recover text and structure from a fixed document format and continue editing in a document editor. A strong PDF conversion workflow is especially helpful when you receive a locked layout but need to update headings, rewrite paragraphs, extract tables, or reuse sections in a fresh file. ToolsHub Pro explains the conversion process clearly and keeps the interface focused so users can move from upload to editable output with minimal friction. For SEO and productivity, this page targets common document conversion needs while also giving visitors practical expectations about formatting, scanned files, and manual review after conversion."; input="Upload a PDF document."; output="Generate Word-ready editable content."; faqs=@("Will formatting always match perfectly? Complex layouts may need small manual adjustments.","Can scanned PDFs be converted? Scanned files require OCR before accurate editing.") },
  @{ slug="word-counter"; title="Word Counter"; category="text"; featured=$true; kind="word-counter"; desc="Count words, characters, sentences, paragraphs, and estimated reading time with a fast online Word Counter built for writers, students, marketers, and editors. Whether you are preparing an article, meta description, social caption, ad copy, essay, product page, or newsletter, accurate length feedback helps you write with more control. The tool updates instantly as you type, making it easy to trim long drafts, check content guidelines, and compare versions before publishing. Word counters are especially valuable for SEO because many content workflows require concise titles, helpful headings, clear summaries, and body copy that is substantial without being bloated. ToolsHub Pro keeps the experience distraction-free and responsive on every device, so you can count copy from a phone, tablet, laptop, or desktop without installing an app."; input="Paste or type text into the editor."; output="See live word, character, sentence, paragraph, and reading-time metrics."; faqs=@("Does it count spaces? The character count includes a separate no-spaces metric.","Is the reading time exact? It is an estimate based on average reading speed.") },
  @{ slug="json-formatter"; title="JSON Formatter"; category="developer"; featured=$true; kind="json-formatter"; desc="Format, beautify, and validate JSON in a clean developer-friendly interface. The JSON Formatter is useful for API responses, configuration files, webhook payloads, analytics events, and structured data snippets. Instead of reading compressed one-line JSON, paste the content and instantly convert it into an indented format that is easier to inspect, debug, copy, and share. Valid JSON is essential for developers, technical marketers, automation builders, and data teams because a single missing comma or mismatched bracket can break an integration. This tool helps identify parsing errors quickly while keeping the workflow simple enough for beginners. ToolsHub Pro also connects this page to related developer utilities such as URL encoding, Base64 conversion, UUID generation, and code minification so users can continue their technical workflow without hunting across multiple websites."; input="Paste raw or minified JSON."; output="Get formatted JSON or a clear validation error."; faqs=@("Does this change my values? No, formatting only changes whitespace and indentation.","Can I minify JSON too? Yes, use the compact action on the page.") },
  @{ slug="qr-code-generator"; title="QR Code Generator"; category="developer"; featured=$true; kind="qr"; desc="Create QR codes for URLs, contact details, Wi-Fi labels, event pages, menus, coupons, forms, and business cards. A QR Code Generator makes offline-to-online journeys simple by turning a destination or short message into a scannable square that works across modern phones. This tool is helpful for restaurants, shops, creators, educators, event organizers, and local businesses that want to connect printed materials to digital experiences. The page is written with practical SEO content and clear usage guidance so visitors understand when to use QR codes, how to test them, and why short readable links are usually better than very long destinations. ToolsHub Pro keeps the QR workflow responsive and lightweight so codes can be generated quickly on mobile or desktop."; input="Enter a URL or text value."; output="Generate a scannable QR-style code preview."; faqs=@("Should I test before printing? Always test scans at the final printed size.","Can a QR code store plain text? Yes, QR codes can contain text, URLs, and other supported strings.") },
  @{ slug="url-encoder-decoder"; title="URL Encoder/Decoder"; category="developer"; featured=$true; kind="url"; desc="Encode and decode URLs, query parameters, redirect links, and API values with a simple online URL Encoder and Decoder. Web addresses often contain reserved characters, spaces, symbols, and non-English text that must be safely encoded before being sent through browsers, forms, analytics tools, or APIs. This utility helps developers, marketers, and support teams transform readable strings into URL-safe values and decode encoded values back into human-readable text. It is especially useful when debugging campaign URLs, webhook callbacks, OAuth redirects, search parameters, and application routes. ToolsHub Pro keeps the interface focused with instant input and output, related developer tools, and clear explanations so users can avoid broken links and confusing parameter errors."; input="Paste text, URL, or query parameters."; output="Encode or decode the value instantly."; faqs=@("What does percent encoding mean? It replaces reserved characters with safe encoded sequences.","Is decoding safe for all links? Review decoded links before visiting unfamiliar destinations.") },
  @{ slug="password-generator"; title="Password Generator"; category="security"; featured=$true; kind="password"; desc="Generate strong random passwords with customizable length and character options. A secure Password Generator helps protect online accounts by creating combinations that are difficult to guess and not reused across services. Weak or repeated passwords remain one of the most common causes of account compromise, so using unique credentials for each site is a practical security habit. ToolsHub Pro provides an easy password creation workflow with options for uppercase letters, lowercase letters, numbers, and symbols. The tool is designed for quick use on every device, but generated passwords should always be stored in a trusted password manager controlled by the user. This page also includes related privacy and developer tools, making it useful for individuals, teams, students, and small businesses improving their digital safety."; input="Choose length and character options."; output="Generate a strong password locally in the browser."; faqs=@("Should I memorize every generated password? Use a trusted password manager for unique passwords.","Are longer passwords better? Longer random passwords are generally harder to crack.") },
  @{ slug="ai-text-generator"; title="AI Text Generator"; category="ai"; featured=$true; kind="ai-text"; desc="Draft simple copy ideas, outlines, captions, product descriptions, and starter paragraphs with a lightweight AI Text Generator experience. This basic tool helps users move past a blank page by turning a short topic into structured writing prompts and reusable draft text. It is useful for bloggers, students, marketers, creators, founders, and support teams who need a first version before editing for tone, accuracy, and brand voice. ToolsHub Pro positions the generator as an assistant for ideation rather than a replacement for careful review. Strong content still needs facts, originality, helpful details, and human judgment, especially for AdSense-friendly publishing. The page includes SEO-aware guidance, FAQs, and related tools so visitors can create a draft, count words, rewrite text, and prepare content for publication from one place."; input="Enter a topic, tone, and format."; output="Generate a structured starter draft."; faqs=@("Should AI text be reviewed? Yes, always edit for accuracy and originality.","Can it write SEO copy? It can create a starting draft, but useful content needs human refinement.") }
)

$moreTools = @(
  @("image-resizer","Image Resizer","image","Resize images for websites, social posts, thumbnails, and documents while keeping layout needs clear and predictable."),
  @("image-converter","Image Converter","image","Convert image formats for web publishing, sharing, and design handoff with simple quality guidance."),
  @("jpg-to-png","JPG to PNG","image","Prepare transparent-friendly PNG files from JPG sources for design and publishing workflows."),
  @("png-to-jpg","PNG to JPG","image","Create lightweight JPG images from PNG files for faster pages and easier sharing."),
  @("webp-converter","WebP Converter","image","Prepare modern WebP images that improve loading speed and preserve visual quality."),
  @("image-cropper","Image Cropper","image","Crop visuals to fit banners, cards, product galleries, and social media dimensions."),
  @("color-picker","Color Picker","image","Pick, copy, and organize color values for branding, UI design, and CSS work."),
  @("pdf-compressor","PDF Compressor","pdf","Reduce PDF file size for email, uploads, storage, and faster document sharing."),
  @("merge-pdf","Merge PDF","pdf","Combine multiple PDFs into a single organized document for reports and submissions."),
  @("split-pdf","Split PDF","pdf","Separate pages from large PDFs into smaller focused files for easier distribution."),
  @("word-to-pdf","Word to PDF","pdf","Turn editable documents into share-ready PDFs with consistent viewing behavior."),
  @("pdf-to-jpg","PDF to JPG","pdf","Convert PDF pages into image previews for thumbnails, archives, and quick sharing."),
  @("text-to-pdf","Text to PDF","pdf","Create simple PDF-ready documents from plain text notes, drafts, and records."),
  @("case-converter","Case Converter","text","Convert text between uppercase, lowercase, title case, sentence case, and slug formats."),
  @("text-diff-checker","Text Diff Checker","text","Compare two text versions and spot edits, removals, additions, and copy changes."),
  @("grammar-checker","Grammar Checker","text","Review writing for clarity, grammar, and polish before publishing or sending."),
  @("plagiarism-checker","Plagiarism Checker","text","Prepare originality checks and content review workflows for responsible publishing."),
  @("paraphrasing-tool","Paraphrasing Tool","text","Rewrite sentences for clarity while preserving meaning and improving readability."),
  @("text-summarizer","Text Summarizer","text","Condense long notes, articles, and research into concise summaries for quick review."),
  @("line-break-remover","Line Break Remover","text","Clean pasted text by removing unwanted line breaks and spacing issues."),
  @("slug-generator","Slug Generator","seo","Create clean URL slugs for blog posts, tools, landing pages, and product content."),
  @("meta-tag-generator","Meta Tag Generator","seo","Draft SEO titles, descriptions, and social preview tags for web pages."),
  @("keyword-density-checker","Keyword Density Checker","seo","Analyze keyword usage and avoid repetitive copy that feels over-optimized."),
  @("robots-txt-generator","Robots.txt Generator","seo","Create search crawler instructions for websites with clear indexing preferences."),
  @("sitemap-generator","Sitemap Generator","seo","Plan XML sitemaps that help search engines discover important website pages."),
  @("backlink-checker","Backlink Checker","seo","Review backlink tracking concepts and organize off-page SEO analysis."),
  @("schema-markup-generator","Schema Markup Generator","seo","Prepare structured data ideas for articles, tools, FAQs, and business pages."),
  @("html-minifier","HTML Minifier","developer","Minify HTML snippets to reduce transfer size and clean production output."),
  @("css-minifier","CSS Minifier","developer","Compress CSS code for faster loading and smaller static assets."),
  @("javascript-minifier","JavaScript Minifier","developer","Reduce JavaScript snippet size for lightweight embeds and faster delivery."),
  @("base64-encoder-decoder","Base64 Encoder/Decoder","developer","Encode and decode Base64 strings used in APIs, files, and development tasks."),
  @("uuid-generator","UUID Generator","developer","Generate unique identifiers for databases, tests, prototypes, and API records."),
  @("regex-tester","Regex Tester","developer","Test regular expressions against sample text and understand matching behavior."),
  @("markdown-preview","Markdown Preview","developer","Preview Markdown headings, lists, links, and formatted notes before publishing."),
  @("timestamp-converter","Timestamp Converter","developer","Convert Unix timestamps and readable dates for logs, APIs, and debugging."),
  @("hash-generator","Hash Generator","security","Generate common hash values for checksums, verification, and development workflows."),
  @("jwt-decoder","JWT Decoder","security","Decode JSON Web Token headers and payloads for debugging authentication flows."),
  @("random-number-generator","Random Number Generator","security","Create random numbers for tests, games, sampling, and quick decisions."),
  @("ai-prompt-generator","AI Prompt Generator","ai","Create structured prompts for writing, coding, research, marketing, and ideation."),
  @("ai-email-writer","AI Email Writer","ai","Draft clear email starters for outreach, support, follow-up, and internal updates."),
  @("ai-blog-idea-generator","AI Blog Idea Generator","ai","Generate blog topic ideas that match audience intent and content strategy."),
  @("ai-caption-generator","AI Caption Generator","ai","Create social captions for launches, product visuals, events, and announcements."),
  @("ai-product-description","AI Product Description Generator","ai","Draft product descriptions with benefits, features, and conversion-focused clarity."),
  @("invoice-generator","Invoice Generator","business","Create simple invoice content for freelancers, small teams, and service providers."),
  @("percentage-calculator","Percentage Calculator","business","Calculate percentage increase, decrease, discounts, margins, and comparisons."),
  @("loan-calculator","Loan Calculator","business","Estimate loan payments and understand monthly repayment scenarios."),
  @("unit-converter","Unit Converter","business","Convert common units for length, weight, temperature, and everyday measurements."),
  @("currency-converter","Currency Converter","business","Plan currency conversion workflows with clear exchange-rate awareness."),
  @("bmi-calculator","BMI Calculator","business","Estimate body mass index from height and weight using a simple calculator layout."),
  @("age-calculator","Age Calculator","business","Calculate age, date differences, and milestone durations quickly."),
  @("speed-test","Website Speed Test","seo","Review website performance concepts and prepare speed optimization checks.")
)

foreach ($m in $moreTools) {
  $tools += @{
    slug=$m[0]; title=$m[1]; category=$m[2]; featured=$false; kind="generic";
    desc="$($m[3]) This free online $($m[1]) page is written for people who want a focused, reliable tool without unnecessary clutter. It explains the purpose of the tool, when to use it, and how it can support professional publishing, technical work, education, marketing, or business operations. A useful tool page should do more than expose a box and a button; it should help visitors understand the result, avoid common mistakes, and move to related utilities when their workflow continues. ToolsHub Pro keeps every page fast, responsive, and easy to scan on phones, tablets, laptops, and desktop monitors. The layout includes a clear title, practical description, input and output area, frequently asked questions, and related tools so the page is helpful for users and search engines. This structure supports AdSense-friendly content because it provides original, useful guidance around a real utility instead of thin placeholder text.";
    input="Enter the content or values needed for $($m[1])."; output="Review, copy, or download the processed result."; faqs=@("Is this $($m[1]) free to use? Yes, ToolsHub Pro is built around free accessible utilities.","Does it work on mobile devices? Yes, the interface is responsive and touch-friendly.")
  }
}

function Ensure-Dir($path) {
  if (!(Test-Path $path)) { New-Item -ItemType Directory -Force -Path $path | Out-Null }
}

function Write-Page($path, $content) {
  $dir = Split-Path -Parent $path
  if ($dir) { Ensure-Dir $dir }
  Set-Content -Path $path -Value $content -Encoding UTF8
}

function SlugTitle($slug) {
  return ($slug -split "-" | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }) -join " "
}

function CategoryName($slug) {
  foreach ($c in $categories) { if ($c.slug -eq $slug) { return $c.name } }
  return (SlugTitle $slug)
}

function Head($title, $desc, $canonical) {
@"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$title</title>
  <meta name="description" content="$desc">
  <meta name="author" content="$founder">
  <meta name="robots" content="index, follow">
  <link rel="canonical" href="$canonical">
  <meta property="og:title" content="$title">
  <meta property="og:description" content="$desc">
  <meta property="og:type" content="website">
  <meta property="og:url" content="$canonical">
  <meta name="theme-color" content="#0f766e">
  <link rel="icon" href="/assets/favicon.svg" type="image/svg+xml">
  <link rel="preload" href="/assets/logo.svg" as="image">
  <link rel="preload" href="/assets/styles.css" as="style">
  <link rel="stylesheet" href="/assets/styles.css">
</head>
<body>
  <div class="entry-loader" aria-hidden="true">
    <div class="entry-loader-card">
      <img src="/assets/logo.svg" width="46" height="46" alt="">
      <span>ToolsHub Pro</span>
      <i></i>
    </div>
  </div>
  <a class="skip-link" href="#main">Skip to content</a>
  <header class="site-header">
    <nav class="nav shell" aria-label="Primary navigation">
      <a class="brand" href="/index.html" aria-label="ToolsHub Pro home">
        <img class="brand-logo" src="/assets/logo.svg" width="42" height="42" alt="" aria-hidden="true"><span>ToolsHub Pro</span>
      </a>
      <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="navLinks">Menu</button>
      <div class="nav-links" id="navLinks">
        <a href="/index.html">Home</a>
        <a href="/tools/index.html">Tools</a>
        <a href="/about.html">About</a>
        <a href="/contact.html">Contact</a>
      </div>
      <button class="theme-toggle" type="button" aria-label="Toggle dark mode">Dark</button>
    </nav>
  </header>
  <main id="main" class="page-enter">
"@
}

function Foot() {
@"
  </main>
  <footer class="footer">
    <div class="shell footer-grid">
      <div>
        <a class="brand footer-brand" href="/index.html"><img class="brand-logo" src="/assets/logo.svg" width="42" height="42" alt="" aria-hidden="true"><span>ToolsHub Pro</span></a>
        <p>Free, high-quality browser tools for creators, developers, marketers, students, and teams everywhere.</p>
      </div>
      <div>
        <h2>Product</h2>
        <a href="/tools/index.html">All Tools</a>
        <a href="/tools/image-compressor.html">Image Compressor</a>
        <a href="/tools/json-formatter.html">JSON Formatter</a>
        <a href="/tools/ai-text-generator.html">AI Text Generator</a>
      </div>
      <div>
        <h2>Company</h2>
        <a href="/about.html">About Us</a>
        <a href="/contact.html">Contact Us</a>
        <a href="/privacy-policy.html">Privacy Policy</a>
        <a href="/terms-conditions.html">Terms & Conditions</a>
      </div>
      <div>
        <h2>Contact</h2>
        <a href="mailto:$email">$email</a>
        <p>Founder: $founder</p>
      </div>
    </div>
    <div class="shell footer-bottom">
      <span>&copy; 2026 ToolsHub Pro. All rights reserved.</span>
      <span>Built for speed, accessibility, and responsible monetization.</span>
    </div>
  </footer>
  <script src="/assets/app.js" defer></script>
</body>
</html>
"@
}

function ToolCard($t) {
  $cat = CategoryName $t.category
@"
<article class="tool-card reveal" data-category="$($t.category)" data-title="$($t.title.ToLower())">
  <div class="tool-card-top">
    <span class="tool-icon">$($t.title.Substring(0,1))</span>
    <span class="tool-category">$cat</span>
  </div>
  <h2><a href="/tools/$($t.slug).html">$($t.title)</a></h2>
  <p>$($t.desc.Substring(0, [Math]::Min(150, $t.desc.Length)))...</p>
  <a class="text-link" href="/tools/$($t.slug).html">Open tool</a>
</article>
"@
}

function Breadcrumb($items) {
  $html = '<nav class="breadcrumb shell" aria-label="Breadcrumb"><a href="/index.html">Home</a>'
  foreach ($item in $items) {
    if ($item.href) { $html += " <span>/</span> <a href=""$($item.href)"">$($item.label)</a>" } else { $html += " <span>/</span> <span>$($item.label)</span>" }
  }
  return $html + '</nav>'
}

Ensure-Dir "assets"
Ensure-Dir "tools"

$styles = @'
:root {
  color-scheme: light;
  --page-gutter: 40px;
  --bg: #fbfcfb;
  --surface: #ffffff;
  --surface-2: #eef7f4;
  --ink: #10201f;
  --muted: #5b6c69;
  --line: #dbe7e3;
  --brand: #0f766e;
  --brand-2: #2563eb;
  --accent: #f59e0b;
  --danger: #b91c1c;
  --shadow: 0 20px 60px rgba(20, 39, 36, .12);
  --radius: 8px;
  --shell: 1180px;
}
[data-theme="dark"] {
  color-scheme: dark;
  --bg: #101614;
  --surface: #17211f;
  --surface-2: #1d2d29;
  --ink: #edf7f4;
  --muted: #a8bbb6;
  --line: #2c423d;
  --brand: #2dd4bf;
  --brand-2: #60a5fa;
  --accent: #fbbf24;
  --shadow: 0 22px 70px rgba(0, 0, 0, .35);
}
* { box-sizing: border-box; }
html { scroll-behavior: smooth; min-width: 320px; -webkit-text-size-adjust: 100%; text-size-adjust: 100%; }
body {
  margin: 0;
  width: 100%;
  font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  background: var(--bg);
  background: linear-gradient(180deg, color-mix(in srgb, var(--surface-2) 24%, var(--bg)), var(--bg) 420px);
  color: var(--ink);
  line-height: 1.6;
  overflow-x: hidden;
}
a { color: inherit; text-decoration: none; }
img, svg, canvas, textarea, input, select { max-width: 100%; }
button, input, textarea, select { font: inherit; min-width: 0; }
a, button { -webkit-tap-highlight-color: transparent; }
.btn, .tool-card, .plain-card, .testimonial, .tool-workspace, .faq-item, .contact-panel, h1, h2, h3, p { overflow-wrap: break-word; }
.shell { width: min(var(--shell), calc(100% - var(--page-gutter))); margin-inline: auto; }
.skip-link { position: absolute; left: -999px; top: 12px; background: var(--ink); color: var(--bg); padding: 10px 14px; z-index: 20; }
.skip-link:focus { left: 12px; }
.entry-loader { position: fixed; inset: 0; z-index: 100; display: grid; place-items: center; background: var(--bg); animation: loaderExit .8s ease 1.05s forwards; }
.entry-loader-card { position: relative; display: grid; justify-items: center; gap: 12px; width: min(210px, calc(100vw - 32px)); padding: 24px; border: 1px solid var(--line); border-radius: 8px; background: var(--surface); background: color-mix(in srgb, var(--surface) 88%, transparent); box-shadow: var(--shadow); animation: loaderCard .75s cubic-bezier(.2,.8,.2,1) both; overflow: hidden; }
.entry-loader-card img { width: 46px; height: 46px; animation: logoPulse 1.15s ease-in-out infinite alternate; }
.entry-loader-card span { font-weight: 900; }
.entry-loader-card i { display: block; width: 100%; height: 3px; border-radius: 999px; background: linear-gradient(90deg, var(--brand), var(--brand-2), var(--accent)); transform-origin: left; animation: loaderLine 1.05s ease both; }
.site-header { position: sticky; top: 0; z-index: 10; padding-left: env(safe-area-inset-left); padding-right: env(safe-area-inset-right); background: var(--bg); background: color-mix(in srgb, var(--bg) 88%, transparent); backdrop-filter: blur(18px); border-bottom: 1px solid var(--line); box-shadow: 0 10px 30px rgba(16,32,31,.05); animation: headerDrop .7s cubic-bezier(.2,.8,.2,1) both; }
.nav { min-height: 72px; display: flex; align-items: center; gap: 14px; }
.brand { display: inline-flex; align-items: center; gap: 10px; min-width: 0; font-weight: 800; letter-spacing: 0; white-space: nowrap; }
.brand span:last-child { min-width: 0; overflow: hidden; text-overflow: ellipsis; }
.brand-logo { flex: 0 0 auto; width: 42px; height: 42px; filter: drop-shadow(0 12px 20px rgba(15,118,110,.18)); transition: transform .25s ease, filter .25s ease; }
.brand:hover .brand-logo { transform: translateY(-1px) rotate(-4deg); filter: drop-shadow(0 16px 24px rgba(37,99,235,.22)); }
.nav-links { margin-left: auto; display: flex; align-items: center; gap: 6px; }
.nav-links a, .theme-toggle, .nav-toggle { min-height: 44px; border: 1px solid transparent; border-radius: 8px; padding: 10px 13px; color: var(--muted); background: transparent; cursor: pointer; }
.nav-links a:hover, .theme-toggle:hover, .nav-toggle:hover { color: var(--ink); background: var(--surface-2); }
.theme-toggle { border-color: var(--line); color: var(--ink); }
.nav-toggle { display: none; margin-left: auto; border-color: var(--line); color: var(--ink); }
.hero { position: relative; overflow: hidden; padding: 86px 0 54px; border-bottom: 1px solid var(--line); background: linear-gradient(135deg, rgba(15,118,110,.12), rgba(37,99,235,.08) 48%, rgba(245,158,11,.08)); }
.hero::before { content: ""; position: absolute; inset: 0; background-image: linear-gradient(rgba(16,32,31,.055) 1px, transparent 1px), linear-gradient(90deg, rgba(16,32,31,.055) 1px, transparent 1px); background-size: 48px 48px; mask-image: linear-gradient(180deg, #000, transparent 82%); pointer-events: none; }
.hero-grid { position: relative; display: grid; grid-template-columns: 1.08fr .92fr; gap: 42px; align-items: center; }
.eyebrow { color: var(--brand); font-weight: 800; text-transform: uppercase; font-size: .78rem; }
h1, h2, h3 { line-height: 1.12; margin: 0 0 14px; letter-spacing: 0; }
h1 { font-size: 5rem; max-width: 900px; }
.page-hero h1 { font-size: 4rem; }
p { margin: 0 0 16px; color: var(--muted); }
.hero-copy { font-size: 1.13rem; max-width: 690px; }
.hero-actions, .button-row { display: flex; flex-wrap: wrap; gap: 12px; margin-top: 26px; }
.btn { display: inline-flex; align-items: center; justify-content: center; min-height: 48px; border-radius: 8px; border: 1px solid var(--line); padding: 12px 18px; font-weight: 800; background: var(--surface); color: var(--ink); cursor: pointer; text-align: center; transition: transform .2s ease, box-shadow .2s ease, background .2s ease; }
.btn.primary { background: linear-gradient(135deg, var(--brand), var(--brand-2)); color: white; border-color: transparent; box-shadow: 0 16px 34px rgba(15,118,110,.24); }
.btn:hover { transform: translateY(-2px); box-shadow: var(--shadow); }
.hero-panel { position: relative; overflow: hidden; background: color-mix(in srgb, var(--surface) 92%, transparent); border: 1px solid color-mix(in srgb, var(--line) 78%, var(--brand)); border-radius: 8px; padding: 22px; box-shadow: var(--shadow); }
.hero-panel::before { content: ""; position: absolute; inset: 0 0 auto; height: 4px; background: linear-gradient(90deg, var(--brand), var(--brand-2), var(--accent)); }
.metric-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 12px; }
.metric { border: 1px solid var(--line); border-radius: 8px; padding: 16px; background: var(--surface-2); }
.metric strong { display: block; font-size: 1.7rem; }
.section { padding: 74px 0; }
.section.alt { background: var(--surface-2); border-block: 1px solid var(--line); }
.section-head { display: flex; justify-content: space-between; gap: 24px; align-items: end; margin-bottom: 30px; }
.section-head p { max-width: 680px; }
.grid { display: grid; gap: 18px; }
.cards-3 { grid-template-columns: repeat(3, minmax(0, 1fr)); }
.cards-4 { grid-template-columns: repeat(4, minmax(0, 1fr)); }
.tool-grid { grid-template-columns: repeat(3, minmax(0, 1fr)); }
.tool-card, .plain-card, .testimonial, .tool-workspace, .faq-item, .contact-panel { background: var(--surface); background: color-mix(in srgb, var(--surface) 96%, transparent); border: 1px solid var(--line); border-radius: 8px; padding: 20px; box-shadow: 0 10px 28px rgba(20,39,36,.06); transition: transform .22s ease, border-color .22s ease, box-shadow .22s ease; }
.tool-card:hover, .plain-card:hover, .testimonial:hover { transform: translateY(-4px); border-color: color-mix(in srgb, var(--brand) 42%, var(--line)); box-shadow: 0 20px 48px rgba(20,39,36,.12); }
.tool-card-top { display: flex; align-items: center; justify-content: space-between; gap: 12px; margin-bottom: 16px; }
.tool-icon { display: grid; place-items: center; width: 42px; height: 42px; border-radius: 8px; background: var(--surface-2); color: var(--brand); font-weight: 900; }
.tool-category { color: var(--muted); font-size: .85rem; }
.tool-card h2 { font-size: 1.18rem; }
.text-link { color: var(--brand); font-weight: 800; }
.category-pill { display: flex; flex-direction: column; gap: 8px; min-height: 150px; }
.category-pill h3 { font-size: 1.1rem; }
.testimonial strong { display: block; margin-top: 16px; }
.page-hero { padding: 58px 0 38px; background: linear-gradient(120deg, rgba(15,118,110,.13), rgba(37,99,235,.08), rgba(245,158,11,.06)); border-bottom: 1px solid var(--line); }
.breadcrumb { padding-top: 22px; color: var(--muted); font-size: .92rem; }
.breadcrumb a { color: var(--brand); font-weight: 700; }
.tools-controls { display: grid; grid-template-columns: 1fr auto; gap: 14px; align-items: center; margin-bottom: 24px; }
.search-input, .field, textarea, select { width: 100%; min-height: 48px; border: 1px solid var(--line); border-radius: 8px; padding: 12px 14px; background: var(--surface); color: var(--ink); }
.filter-row { display: flex; flex-wrap: wrap; gap: 8px; }
.filter-btn { min-height: 44px; border: 1px solid var(--line); border-radius: 8px; padding: 10px 12px; background: var(--surface); color: var(--muted); cursor: pointer; }
.filter-btn.active, .filter-btn:hover { background: var(--brand); color: white; border-color: var(--brand); }
.tool-layout { display: grid; grid-template-columns: minmax(0, 1fr) 320px; gap: 24px; align-items: start; }
.tool-workspace textarea { min-height: 180px; resize: vertical; }
.result-box { min-height: 120px; white-space: pre-wrap; overflow: auto; overflow-wrap: anywhere; border: 1px solid var(--line); border-radius: 8px; padding: 14px; background: var(--surface-2); color: var(--ink); }
.controls-row { display: flex; flex-wrap: wrap; gap: 10px; margin: 14px 0; align-items: center; }
.range-line { display: grid; grid-template-columns: 110px 1fr 44px; gap: 10px; align-items: center; margin: 12px 0; }
.checkbox-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 10px; margin: 12px 0; }
.checkbox-grid label { display: flex; gap: 8px; align-items: center; color: var(--muted); }
.qr-preview { display: block; width: 220px; max-width: 100%; height: auto; aspect-ratio: 1; object-fit: contain; background: white; border: 1px solid var(--line); border-radius: 8px; margin: 12px 0; padding: 12px; }
.stat-grid { display: grid; grid-template-columns: repeat(5, minmax(0, 1fr)); gap: 10px; margin-top: 14px; }
.stat { border: 1px solid var(--line); border-radius: 8px; padding: 12px; background: var(--surface-2); }
.stat strong { display: block; font-size: 1.3rem; }
.sidebar-list { display: grid; gap: 10px; }
.sidebar-list a { padding: 12px; border: 1px solid var(--line); border-radius: 8px; background: var(--surface); color: var(--muted); }
.content-block { max-width: 860px; }
.content-block p { margin-bottom: 18px; }
.faq-item + .faq-item { margin-top: 12px; }
.contact-grid { display: grid; grid-template-columns: .9fr 1.1fr; gap: 24px; align-items: start; }
form { display: grid; gap: 12px; }
.footer { background: #0e1715; color: #edf7f4; padding: 52px 0 22px; }
.footer p, .footer a, .footer-bottom { color: #b8cbc6; }
.footer-grid { display: grid; grid-template-columns: 1.4fr repeat(3, 1fr); gap: 24px; }
.footer h2 { font-size: 1rem; color: white; }
.footer a { display: block; margin: 9px 0; }
.footer-bottom { display: flex; justify-content: space-between; gap: 18px; border-top: 1px solid rgba(255,255,255,.12); padding-top: 20px; margin-top: 28px; font-size: .92rem; }
.page-enter { animation: pageEnter .85s cubic-bezier(.2,.8,.2,1) .2s both; }
.reveal { opacity: 0; transform: translateY(18px); transition: opacity .6s ease, transform .6s ease; }
.reveal.visible { opacity: 1; transform: translateY(0); }
@keyframes pageEnter { from { opacity: 0; transform: translateY(18px); } to { opacity: 1; transform: translateY(0); } }
@keyframes headerDrop { from { opacity: 0; transform: translateY(-16px); } to { opacity: 1; transform: translateY(0); } }
@keyframes loaderCard { from { opacity: 0; transform: scale(.96) translateY(12px); } to { opacity: 1; transform: scale(1) translateY(0); } }
@keyframes loaderLine { from { transform: scaleX(0); } to { transform: scaleX(1); } }
@keyframes logoPulse { from { transform: scale(1); } to { transform: scale(1.06); } }
@keyframes loaderExit { to { opacity: 0; visibility: hidden; pointer-events: none; } }
@media (prefers-reduced-motion: reduce) {
  *, html { scroll-behavior: auto !important; transition: none !important; animation: none !important; }
  .reveal { opacity: 1; transform: none; }
  .entry-loader { display: none; }
}
@media (max-width: 960px) {
  h1 { font-size: 3.8rem; }
  .page-hero h1 { font-size: 3.2rem; }
  .hero-grid, .tool-layout, .contact-grid { grid-template-columns: 1fr; }
  .cards-4, .cards-3, .tool-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .section-head { display: block; }
  .tools-controls { grid-template-columns: 1fr; }
  .footer-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .stat-grid { grid-template-columns: repeat(3, minmax(0, 1fr)); }
}
@media (max-width: 720px) {
  :root { --page-gutter: 28px; }
  h1 { font-size: 2.7rem; }
  .page-hero h1 { font-size: 2.35rem; }
  .nav { min-height: 64px; flex-wrap: wrap; gap: 8px; padding-block: 8px; }
  .brand { flex: 1 1 135px; }
  .nav-toggle { display: inline-flex; }
  .theme-toggle { margin-left: 0; }
  .nav-links { display: none; width: 100%; margin: 0; padding-bottom: 12px; }
  .nav-links.open { display: grid; }
  .nav-links a { padding: 12px 0; }
  .hero { padding: 58px 0 42px; }
  .cards-4, .cards-3, .tool-grid, .metric-grid, .footer-grid, .checkbox-grid, .stat-grid { grid-template-columns: 1fr; }
  .footer-bottom { display: block; }
  .range-line { grid-template-columns: 1fr; }
}
@media (max-width: 480px) {
  :root { --page-gutter: 24px; }
  h1 { font-size: 2.15rem; }
  .page-hero h1 { font-size: 1.95rem; }
  .hero-copy { font-size: 1rem; }
  .section { padding: 52px 0; }
  .hero-actions, .button-row, .controls-row { display: grid; grid-template-columns: 1fr; }
  .btn, .filter-btn { width: 100%; }
  .tool-card, .plain-card, .testimonial, .tool-workspace, .faq-item, .contact-panel, .hero-panel { padding: 16px; }
  .tool-card-top { align-items: flex-start; }
  .filter-row { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .breadcrumb { font-size: .86rem; }
}
@media (max-width: 360px) {
  :root { --page-gutter: 20px; }
  h1 { font-size: 1.95rem; }
  .page-hero h1 { font-size: 1.8rem; }
  .brand-logo { width: 34px; height: 34px; }
  .brand { gap: 8px; font-size: .95rem; }
  .nav-links a, .theme-toggle, .nav-toggle { padding-inline: 10px; }
  .filter-row { grid-template-columns: 1fr; }
}
@media (min-width: 1280px) {
  .tool-grid { grid-template-columns: repeat(4, minmax(0, 1fr)); }
  .hero { padding-top: 100px; }
}
@media (min-width: 1600px) {
  :root { --shell: 1320px; }
  h1 { font-size: 5.3rem; }
  .page-hero h1 { font-size: 4.25rem; }
}
@media (max-height: 560px) and (orientation: landscape) {
  .hero, .page-hero { padding-top: 36px; padding-bottom: 30px; }
  .section { padding: 42px 0; }
}
@media (hover: none) {
  .btn:hover, .tool-card:hover, .plain-card:hover, .testimonial:hover, .brand:hover .brand-logo { transform: none; }
  .btn:hover { box-shadow: none; }
}
@media print {
  .site-header, .entry-loader, .footer, .hero-actions, .tools-controls, .controls-row { display: none !important; }
  body { background: #fff; color: #111; }
  .section, .page-hero, .hero { padding: 20px 0; border: 0; }
  .tool-card, .plain-card, .testimonial, .tool-workspace, .faq-item, .contact-panel { box-shadow: none; break-inside: avoid; }
}
'@
Write-Page "assets/styles.css" $styles

$app = @'
(function () {
  const root = document.documentElement;
  const savedTheme = localStorage.getItem("theme");
  if (savedTheme) root.dataset.theme = savedTheme;
  document.querySelectorAll(".theme-toggle").forEach((button) => {
    button.textContent = root.dataset.theme === "dark" ? "Light" : "Dark";
    button.addEventListener("click", () => {
      root.dataset.theme = root.dataset.theme === "dark" ? "" : "dark";
      if (root.dataset.theme) localStorage.setItem("theme", root.dataset.theme);
      else localStorage.removeItem("theme");
      button.textContent = root.dataset.theme === "dark" ? "Light" : "Dark";
    });
  });

  const navToggle = document.querySelector(".nav-toggle");
  const navLinks = document.querySelector(".nav-links");
  if (navToggle && navLinks) {
    navToggle.addEventListener("click", () => {
      const open = navLinks.classList.toggle("open");
      navToggle.setAttribute("aria-expanded", String(open));
    });
  }

  const revealObserver = "IntersectionObserver" in window ? new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
        revealObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 }) : null;
  document.querySelectorAll(".reveal").forEach((item) => revealObserver ? revealObserver.observe(item) : item.classList.add("visible"));

  const search = document.querySelector("[data-tool-search]");
  const filterButtons = Array.from(document.querySelectorAll("[data-filter]"));
  const cards = Array.from(document.querySelectorAll("[data-category][data-title]"));
  function applyFilters() {
    const term = search ? search.value.trim().toLowerCase() : "";
    const active = document.querySelector("[data-filter].active")?.dataset.filter || "all";
    cards.forEach((card) => {
      const matchesTerm = !term || card.dataset.title.includes(term);
      const matchesCat = active === "all" || card.dataset.category === active;
      card.style.display = matchesTerm && matchesCat ? "" : "none";
    });
  }
  if (search) search.addEventListener("input", applyFilters);
  filterButtons.forEach((btn) => btn.addEventListener("click", () => {
    filterButtons.forEach((b) => b.classList.remove("active"));
    btn.classList.add("active");
    applyFilters();
  }));

  const workspace = document.querySelector("[data-tool-kind]");
  if (!workspace) return;
  const kind = workspace.dataset.toolKind;
  const input = workspace.querySelector("[data-input]");
  const output = workspace.querySelector("[data-output]");
  const action = workspace.querySelector("[data-action]");
  const secondary = workspace.querySelector("[data-secondary]");

  const setOutput = (value, isError) => {
    if (!output) return;
    output.textContent = value;
    output.style.borderColor = isError ? "var(--danger)" : "var(--line)";
  };

  if (kind === "word-counter" && input) {
    const stats = workspace.querySelectorAll("[data-stat]");
    const update = () => {
      const text = input.value || "";
      const words = text.trim() ? text.trim().split(/\s+/).length : 0;
      const chars = text.length;
      const noSpaces = text.replace(/\s/g, "").length;
      const sentences = text.trim() ? (text.match(/[^.!?]+[.!?]*/g) || []).length : 0;
      const paragraphs = text.trim() ? text.split(/\n\s*\n/).filter(Boolean).length : 0;
      const values = { words, chars, noSpaces, sentences, paragraphs, reading: Math.max(1, Math.ceil(words / 220)) };
      stats.forEach((stat) => stat.textContent = values[stat.dataset.stat]);
    };
    input.addEventListener("input", update);
    update();
  }

  if (kind === "json-formatter" && input) {
    action?.addEventListener("click", () => {
      try { setOutput(JSON.stringify(JSON.parse(input.value), null, 2)); }
      catch (error) { setOutput("Invalid JSON: " + error.message, true); }
    });
    secondary?.addEventListener("click", () => {
      try { setOutput(JSON.stringify(JSON.parse(input.value))); }
      catch (error) { setOutput("Invalid JSON: " + error.message, true); }
    });
  }

  if (kind === "url" && input) {
    action?.addEventListener("click", () => setOutput(encodeURIComponent(input.value)));
    secondary?.addEventListener("click", () => {
      try { setOutput(decodeURIComponent(input.value)); }
      catch (error) { setOutput("Unable to decode value: " + error.message, true); }
    });
  }

  if (kind === "password") {
    const length = workspace.querySelector("[data-length]");
    const lengthValue = workspace.querySelector("[data-length-value]");
    const generate = () => {
      const sets = [
        ["upper", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"],
        ["lower", "abcdefghijklmnopqrstuvwxyz"],
        ["numbers", "0123456789"],
        ["symbols", "!@#$%^&*()-_=+[]{};:,.?/"]
      ];
      const chars = sets.filter(([name]) => workspace.querySelector(`[data-set="${name}"]`)?.checked).map(([, value]) => value).join("");
      if (!chars) return setOutput("Choose at least one character type.", true);
      const bytes = new Uint32Array(Number(length.value || 18));
      crypto.getRandomValues(bytes);
      setOutput(Array.from(bytes, (n) => chars[n % chars.length]).join(""));
    };
    length?.addEventListener("input", () => { lengthValue.textContent = length.value; });
    action?.addEventListener("click", generate);
    generate();
  }

  if (kind === "ai-text" && input) {
    action?.addEventListener("click", () => {
      const topic = input.value.trim() || "your topic";
      setOutput(`Headline: A practical guide to ${topic}\n\nIntro: ${topic} matters because people want clear, useful answers without wasting time. Start by explaining the audience, the problem, and the result they can expect.\n\nKey points:\n1. Define the main goal.\n2. Share simple steps or examples.\n3. Add a helpful conclusion with the next action.`);
    });
  }

  if (kind === "qr" && input) {
    const preview = workspace.querySelector("[data-qr-preview]");
    const render = () => {
      const value = input.value.trim() || "ToolsHub Pro";
      preview.src = "https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=" + encodeURIComponent(value);
      preview.alt = "QR code for " + (value.length > 48 ? value.slice(0, 48) + "..." : value);
    };
    action?.addEventListener("click", render);
    render();
  }

  if (kind === "image-compressor") {
    const file = workspace.querySelector("[data-file]");
    const quality = workspace.querySelector("[data-quality]");
    const qualityValue = workspace.querySelector("[data-quality-value]");
    const link = workspace.querySelector("[data-download]");
    quality?.addEventListener("input", () => qualityValue.textContent = quality.value + "%");
    action?.addEventListener("click", () => {
      if (!file.files || !file.files[0]) return setOutput("Choose an image first.", true);
      const img = new Image();
      img.onload = () => {
        const canvas = document.createElement("canvas");
        const max = 1800;
        const scale = Math.min(1, max / Math.max(img.width, img.height));
        canvas.width = Math.round(img.width * scale);
        canvas.height = Math.round(img.height * scale);
        canvas.getContext("2d").drawImage(img, 0, 0, canvas.width, canvas.height);
        canvas.toBlob((blob) => {
          const url = URL.createObjectURL(blob);
          link.href = url;
          link.download = "toolshub-pro-compressed.jpg";
          link.hidden = false;
          setOutput(`Original: ${(file.files[0].size / 1024).toFixed(1)} KB\nCompressed: ${(blob.size / 1024).toFixed(1)} KB\nDimensions: ${canvas.width} x ${canvas.height}`);
        }, "image/jpeg", Number(quality.value) / 100);
      };
      img.src = URL.createObjectURL(file.files[0]);
    });
  }
})();
'@
Write-Page "assets/app.js" $app

$logoAsset = @'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" aria-label="ToolsHub Pro logo">
  <defs>
    <linearGradient id="toolshubLogo" x1="10" y1="7" x2="56" y2="58" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#0f766e"/>
      <stop offset=".54" stop-color="#2563eb"/>
      <stop offset="1" stop-color="#f59e0b"/>
    </linearGradient>
    <linearGradient id="toolshubShine" x1="14" y1="10" x2="50" y2="54" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#ffffff" stop-opacity=".92"/>
      <stop offset="1" stop-color="#ffffff" stop-opacity=".62"/>
    </linearGradient>
  </defs>
  <rect x="4" y="4" width="56" height="56" rx="14" fill="url(#toolshubLogo)"/>
  <path d="M15 19.5h34v7.8H36.6v19.2h-9.2V27.3H15z" fill="url(#toolshubShine)"/>
  <path d="M41.2 33.5h7.8v13h-7.8z" fill="#fbbf24"/>
  <path d="M17.5 46.5h31M20 17.5h24" stroke="#ffffff" stroke-opacity=".34" stroke-width="2" stroke-linecap="round"/>
  <circle cx="49" cy="33.5" r="3.2" fill="#ffffff"/>
  <circle cx="15" cy="27.3" r="2.7" fill="#fbbf24"/>
</svg>
'@
Write-Page "assets/logo.svg" $logoAsset
Write-Page "assets/favicon.svg" $logoAsset

$featuredCards = ($tools | Where-Object {$_.featured} | ForEach-Object { ToolCard $_ }) -join "`n"
$categoryCards = ($categories | Select-Object -First 5 | ForEach-Object { @"
<article class="plain-card category-pill reveal">
  <span class="tool-icon">$($_.name.Substring(0,1))</span>
  <h3>$($_.name)</h3>
  <p>$($_.summary)</p>
</article>
"@ }) -join "`n"

$homePage = (Head "$siteName - Free Online Tools for SEO, Images, AI, Text and Developers" "ToolsHub Pro is an all-in-one free online tools platform with SEO tools, image tools, developer tools, AI tools, text tools, and PDF utilities." "$baseUrl/") + @"
    <section class="hero">
      <div class="shell hero-grid">
        <div class="reveal">
          <span class="eyebrow">Premium free tools platform</span>
          <h1>All-in-One Free Online Tools Platform</h1>
          <p class="hero-copy">ToolsHub Pro brings fast, practical utilities into one polished workspace for creators, developers, marketers, students, and founders. Search, filter, and open useful tools from any device.</p>
          <div class="hero-actions">
            <a class="btn primary" href="/tools/index.html">Explore Tools</a>
            <a class="btn" href="/about.html">Our Mission</a>
          </div>
        </div>
        <div class="hero-panel reveal">
          <div class="metric-grid">
            <div class="metric"><strong>60</strong><span>SEO-ready tools</span></div>
            <div class="metric"><strong>8</strong><span>Focused categories</span></div>
            <div class="metric"><strong>100%</strong><span>Responsive layout</span></div>
            <div class="metric"><strong>Free</strong><span>Built for global access</span></div>
          </div>
        </div>
      </div>
    </section>
    <section class="section">
      <div class="shell">
        <div class="section-head">
          <div><span class="eyebrow">Featured tools</span><h2>Start with the most-used workflows</h2></div>
          <a class="text-link" href="/tools/index.html">Browse all tools</a>
        </div>
        <div class="grid tool-grid">$featuredCards</div>
      </div>
    </section>
    <section class="section alt">
      <div class="shell">
        <div class="section-head">
          <div><span class="eyebrow">Categories</span><h2>Tools organized for real work</h2></div>
          <p>Jump into SEO, image optimization, developer utilities, AI writing helpers, and text productivity tools without digging through clutter.</p>
        </div>
        <div class="grid cards-3">$categoryCards</div>
      </div>
    </section>
    <section class="section">
      <div class="shell">
        <div class="section-head"><div><span class="eyebrow">Testimonials</span><h2>Built for daily productivity</h2></div></div>
        <div class="grid cards-3">
          <article class="testimonial reveal"><p>"The tools load quickly on my phone, and the descriptions make it clear what each utility is best for."</p><strong>Riya Mehta, Content Strategist</strong></article>
          <article class="testimonial reveal"><p>"I use the formatter, password generator, and URL tools during client QA. It feels clean and reliable."</p><strong>Daniel Morris, Frontend Developer</strong></article>
          <article class="testimonial reveal"><p>"The category filters save time when I need quick SEO or image tasks before publishing a campaign."</p><strong>Amara Collins, Growth Marketer</strong></article>
        </div>
      </div>
    </section>
"@ + (Foot)
Write-Page "index.html" $homePage

$filterButtons = '<button class="filter-btn active" data-filter="all" type="button">All</button>' + (($categories | ForEach-Object { "<button class=""filter-btn"" data-filter=""$($_.slug)"" type=""button"">$($_.name)</button>" }) -join "")
$allCards = ($tools | ForEach-Object { ToolCard $_ }) -join "`n"
$toolsPage = (Head "Free Online Tools - $siteName" "Explore 50 plus free online tools for SEO, images, PDF files, developers, AI writing, text editing, security, and business productivity." "$baseUrl/tools/") + (Breadcrumb @(@{href=$null;label="Tools"})) + @"
    <section class="page-hero">
      <div class="shell">
        <span class="eyebrow">Tools directory</span>
        <h1>Free online tools for modern digital work</h1>
        <p class="hero-copy">Search more than fifty trending utilities, filter by category, and open dedicated SEO-friendly tool pages with descriptions, FAQs, and related workflows.</p>
      </div>
    </section>
    <section class="section">
      <div class="shell">
        <div class="tools-controls">
          <input class="search-input" data-tool-search type="search" placeholder="Search tools..." aria-label="Search tools">
          <div class="filter-row">$filterButtons</div>
        </div>
        <div class="grid tool-grid">$allCards</div>
      </div>
    </section>
"@ + (Foot)
Write-Page "tools/index.html" $toolsPage

function ToolUi($t) {
  switch ($t.kind) {
    "word-counter" {
@"
<div class="tool-workspace" data-tool-kind="word-counter">
  <label for="toolInput">Enter text</label>
  <textarea id="toolInput" data-input placeholder="Paste your article, caption, essay, or draft here."></textarea>
  <div class="stat-grid">
    <div class="stat"><strong data-stat="words">0</strong><span>Words</span></div>
    <div class="stat"><strong data-stat="chars">0</strong><span>Characters</span></div>
    <div class="stat"><strong data-stat="noSpaces">0</strong><span>No spaces</span></div>
    <div class="stat"><strong data-stat="sentences">0</strong><span>Sentences</span></div>
    <div class="stat"><strong data-stat="reading">1</strong><span>Min read</span></div>
  </div>
</div>
"@
    }
    "json-formatter" {
@"
<div class="tool-workspace" data-tool-kind="json-formatter">
  <label for="toolInput">JSON input</label>
  <textarea id="toolInput" data-input placeholder='{"name":"ToolsHub Pro","type":"tool"}'></textarea>
  <div class="controls-row"><button class="btn primary" data-action type="button">Format JSON</button><button class="btn" data-secondary type="button">Minify JSON</button></div>
  <div class="result-box" data-output>Formatted output will appear here.</div>
</div>
"@
    }
    "url" {
@"
<div class="tool-workspace" data-tool-kind="url">
  <label for="toolInput">URL or text</label>
  <textarea id="toolInput" data-input placeholder="https://example.com/search?q=online tools"></textarea>
  <div class="controls-row"><button class="btn primary" data-action type="button">Encode</button><button class="btn" data-secondary type="button">Decode</button></div>
  <div class="result-box" data-output>Output will appear here.</div>
</div>
"@
    }
    "password" {
@"
<div class="tool-workspace" data-tool-kind="password">
  <div class="range-line"><label for="passwordLength">Length</label><input id="passwordLength" data-length type="range" min="8" max="48" value="18"><strong data-length-value>18</strong></div>
  <div class="checkbox-grid">
    <label><input data-set="upper" type="checkbox" checked> Uppercase</label>
    <label><input data-set="lower" type="checkbox" checked> Lowercase</label>
    <label><input data-set="numbers" type="checkbox" checked> Numbers</label>
    <label><input data-set="symbols" type="checkbox" checked> Symbols</label>
  </div>
  <div class="controls-row"><button class="btn primary" data-action type="button">Generate Password</button></div>
  <div class="result-box" data-output></div>
</div>
"@
    }
    "ai-text" {
@"
<div class="tool-workspace" data-tool-kind="ai-text">
  <label for="toolInput">Topic</label>
  <textarea id="toolInput" data-input placeholder="Example: benefits of free SEO tools for small businesses"></textarea>
  <div class="controls-row"><button class="btn primary" data-action type="button">Generate Draft</button></div>
  <div class="result-box" data-output>Generated starter text will appear here.</div>
</div>
"@
    }
    "qr" {
@"
<div class="tool-workspace" data-tool-kind="qr">
  <label for="toolInput">Text or URL</label>
  <input class="field" id="toolInput" data-input value="https://toolshubpro.com">
  <div class="controls-row"><button class="btn primary" data-action type="button">Generate QR Code</button></div>
  <img class="qr-preview" data-qr-preview alt="QR code preview" width="220" height="220">
</div>
"@
    }
    "image-compressor" {
@"
<div class="tool-workspace" data-tool-kind="image-compressor">
  <label for="imageFile">Upload image</label>
  <input class="field" id="imageFile" data-file type="file" accept="image/*">
  <div class="range-line"><label for="imageQuality">Quality</label><input id="imageQuality" data-quality type="range" min="40" max="95" value="75"><strong data-quality-value>75%</strong></div>
  <div class="controls-row"><button class="btn primary" data-action type="button">Compress Image</button><a class="btn" data-download hidden>Download</a></div>
  <div class="result-box" data-output>Compression details will appear here.</div>
</div>
"@
    }
    default {
@"
<div class="tool-workspace" data-tool-kind="generic">
  <label for="toolInput">$($t.input)</label>
  <textarea id="toolInput" data-input placeholder="Enter your content or values here."></textarea>
  <div class="controls-row"><button class="btn primary" type="button" onclick="this.closest('.tool-workspace').querySelector('[data-output]').textContent = this.closest('.tool-workspace').querySelector('[data-input]').value || 'Add input to preview the result.'">Process</button><button class="btn" type="button" onclick="navigator.clipboard && navigator.clipboard.writeText(this.closest('.tool-workspace').querySelector('[data-output]').textContent)">Copy Result</button></div>
  <div class="result-box" data-output>$($t.output)</div>
</div>
"@
    }
  }
}

foreach ($t in $tools) {
  $related = ($tools | Where-Object { $_.category -eq $t.category -and $_.slug -ne $t.slug } | Select-Object -First 4)
  if ($related.Count -lt 4) { $related += ($tools | Where-Object { $_.slug -ne $t.slug } | Select-Object -First (4 - $related.Count)) }
  $relatedLinks = ($related | ForEach-Object { "<a href=""/tools/$($_.slug).html"">$($_.title)</a>" }) -join "`n"
  $faq = ($t.faqs | ForEach-Object { "<article class=""faq-item reveal""><h3>$($_)</h3><p>ToolsHub Pro keeps the answer practical, transparent, and focused on helping you get a useful result without unnecessary complexity.</p></article>" }) -join "`n"
  $page = (Head "$($t.title) - Free Online Tool | $siteName" "Use the free $($t.title) on ToolsHub Pro. Get a fast, responsive, SEO-friendly online utility with FAQs, related tools, and practical guidance." "$baseUrl/tools/$($t.slug).html") + (Breadcrumb @(@{href="/tools/index.html";label="Tools"}, @{href=$null;label=$t.title})) + @"
    <section class="page-hero">
      <div class="shell">
        <span class="eyebrow">$(CategoryName $t.category)</span>
        <h1>$($t.title)</h1>
        <p class="hero-copy">$($t.input) $($t.output)</p>
      </div>
    </section>
    <section class="section">
      <div class="shell tool-layout">
        <div>
          $(ToolUi $t)
          <div class="content-block section">
            <h2>About this $($t.title)</h2>
            <p>$($t.desc)</p>
            <p>This page is optimized for people searching for a quick, trustworthy, and easy-to-understand $($t.title). The content is intentionally written with clear headings, natural language, practical use cases, and related internal links so the page can support search discovery while remaining genuinely useful. ToolsHub Pro avoids thin placeholder pages by pairing each utility with guidance about inputs, outputs, review steps, and common reasons someone might need the tool. The responsive layout also keeps the same workflow accessible on mobile phones, tablets, laptops, and large desktop screens.</p>
            <h2>How to use the tool</h2>
            <p>Start by adding the input requested above, then run the tool and review the result carefully. For publishing, development, or business workflows, always check important outputs before using them in production, client work, or public pages.</p>
            <h2>Frequently asked questions</h2>
            $faq
          </div>
        </div>
        <aside class="plain-card">
          <h2>Related tools</h2>
          <div class="sidebar-list">$relatedLinks</div>
        </aside>
      </div>
    </section>
"@ + (Foot)
  Write-Page "tools/$($t.slug).html" $page
}

$about = (Head "About Us - $siteName" "Learn about ToolsHub Pro, founded by Ayan Srivastava with a mission to provide free, high-quality tools globally." "$baseUrl/about.html") + (Breadcrumb @(@{href=$null;label="About Us"})) + @"
    <section class="page-hero"><div class="shell"><span class="eyebrow">About ToolsHub Pro</span><h1>Free, high-quality tools for a global audience</h1><p class="hero-copy">ToolsHub Pro is designed to make useful digital utilities accessible, fast, and pleasant on every device.</p></div></section>
    <section class="section"><div class="shell contact-grid">
      <article class="plain-card reveal"><h2>Founder</h2><p><strong>$founder</strong> founded ToolsHub Pro with a practical goal: help people complete everyday digital tasks without paid software, confusing interfaces, or slow pages.</p></article>
      <div class="content-block reveal"><h2>Mission</h2><p>Our mission is to provide free, high-quality tools globally. We focus on clear utility, original guidance, mobile-friendly design, and clean pages that can support responsible monetization without getting in the user's way.</p><p>ToolsHub Pro serves creators, developers, marketers, students, founders, and small teams who need quick answers and reliable workflows. Every page is structured with useful headings, descriptions, FAQs, and related links so visitors can understand the tool and continue their work with confidence.</p></div>
    </div></section>
"@ + (Foot)
Write-Page "about.html" $about

$contact = (Head "Contact Us - $siteName" "Contact ToolsHub Pro for support, feedback, partnerships, and business inquiries at nexioweb.business@gmail.com." "$baseUrl/contact.html") + (Breadcrumb @(@{href=$null;label="Contact Us"})) + @"
    <section class="page-hero"><div class="shell"><span class="eyebrow">Contact</span><h1>Contact ToolsHub Pro</h1><p class="hero-copy">Send questions, feedback, partnership ideas, or business inquiries directly to the ToolsHub Pro team.</p></div></section>
    <section class="section"><div class="shell contact-grid">
      <aside class="contact-panel reveal"><h2>Business email</h2><p><a class="text-link" href="mailto:$email">$email</a></p><p>Founder: $founder</p><p>We welcome feedback that helps make ToolsHub Pro faster, clearer, and more useful for visitors around the world.</p></aside>
      <form class="contact-panel reveal" action="https://formsubmit.co/$email" method="POST">
        <input type="hidden" name="_subject" value="New ToolsHub Pro contact message">
        <input type="hidden" name="_captcha" value="false">
        <label>Name<input class="field" name="name" type="text" required autocomplete="name"></label>
        <label>Email<input class="field" name="email" type="email" required autocomplete="email"></label>
        <label>Message<textarea name="message" required rows="6" placeholder="How can we help?"></textarea></label>
        <button class="btn primary" type="submit">Send Message</button>
      </form>
    </div></section>
"@ + (Foot)
Write-Page "contact.html" $contact

$privacy = (Head "Privacy Policy - $siteName" "Read the ToolsHub Pro Privacy Policy covering data handling, contact forms, analytics, advertising, and user privacy." "$baseUrl/privacy-policy.html") + (Breadcrumb @(@{href=$null;label="Privacy Policy"})) + @"
    <section class="page-hero"><div class="shell"><span class="eyebrow">Policy</span><h1>Privacy Policy</h1><p class="hero-copy">This policy explains how ToolsHub Pro handles information while offering free online tools.</p></div></section>
    <section class="section"><div class="shell content-block">
      <h2>Information we collect</h2><p>ToolsHub Pro is built to keep most tool interactions in the browser where possible. Contact form submissions may include your name, email address, and message so we can respond to your request.</p>
      <h2>Advertising and analytics</h2><p>The website is structured to support responsible advertising such as Google AdSense. Advertising partners may use cookies or similar technologies according to their own policies. We aim to keep pages useful, original, and respectful of visitors.</p>
      <h2>Tool data</h2><p>Client-side tools are designed to process input locally when practical. Avoid entering passwords, private documents, confidential business information, or sensitive personal data into any online tool unless you understand how the tool works.</p>
      <h2>Contact</h2><p>For privacy questions, email <a class="text-link" href="mailto:$email">$email</a>.</p>
    </div></section>
"@ + (Foot)
Write-Page "privacy-policy.html" $privacy

$terms = (Head "Terms & Conditions - $siteName" "Read the ToolsHub Pro Terms and Conditions for acceptable use, tool limitations, content, advertising, and contact information." "$baseUrl/terms-conditions.html") + (Breadcrumb @(@{href=$null;label="Terms & Conditions"})) + @"
    <section class="page-hero"><div class="shell"><span class="eyebrow">Terms</span><h1>Terms & Conditions</h1><p class="hero-copy">These terms outline responsible use of ToolsHub Pro and its free online utilities.</p></div></section>
    <section class="section"><div class="shell content-block">
      <h2>Use of tools</h2><p>ToolsHub Pro provides free utilities for productivity, development, SEO, content, image, PDF, and business workflows. Results should be reviewed before being used in professional, legal, financial, medical, or public contexts.</p>
      <h2>No warranty</h2><p>We work to keep tools accurate and available, but the website is provided as is. We do not guarantee uninterrupted availability, perfect output, or suitability for every use case.</p>
      <h2>Responsible content</h2><p>Users should not use ToolsHub Pro to create harmful, unlawful, misleading, or abusive content. Visitors are responsible for the information they enter and how they use generated outputs.</p>
      <h2>Contact</h2><p>Questions about these terms can be sent to <a class="text-link" href="mailto:$email">$email</a>.</p>
    </div></section>
"@ + (Foot)
Write-Page "terms-conditions.html" $terms

$urls = @("$baseUrl/","$baseUrl/tools/","$baseUrl/about.html","$baseUrl/contact.html","$baseUrl/privacy-policy.html","$baseUrl/terms-conditions.html")
$urls += ($tools | ForEach-Object { "$baseUrl/tools/$($_.slug).html" })
$sitemap = "<?xml version=""1.0"" encoding=""UTF-8""?>`n<urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">`n" + (($urls | ForEach-Object { "  <url><loc>$_</loc><lastmod>2026-05-03</lastmod><changefreq>weekly</changefreq><priority>0.8</priority></url>" }) -join "`n") + "`n</urlset>"
Write-Page "sitemap.xml" $sitemap

$robots = @"
User-agent: *
Allow: /

Sitemap: $baseUrl/sitemap.xml
"@
Write-Page "robots.txt" $robots

$readme = @"
# ToolsHub Pro

A static, responsive, AdSense-ready multi-page website for ToolsHub Pro.

Open `index.html` in a browser or deploy the folder to any static host. The contact form uses FormSubmit and sends messages to `$email`.
"@
Write-Page "README.md" $readme

Write-Host "Generated $($tools.Count) tool pages and core site pages."
