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
