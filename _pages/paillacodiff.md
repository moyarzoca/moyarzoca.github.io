---
permalink: /paillacodiff/
title: "PaillacoDiff"
author_profile: false
layout: single
---

<div id="paillacodiff-docs">
  Loading documentation...
</div>

<!-- KaTeX -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css"
>

<script src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js"></script>

<!-- Prism syntax highlighting -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/prismjs/themes/prism.min.css"
>

<script src="https://cdn.jsdelivr.net/npm/prismjs/prism.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/prismjs/components/prism-mathematica.min.js"></script>

<!-- Markdown -->
<script src="https://cdn.jsdelivr.net/npm/marked/lib/marked.umd.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked-katex-extension/lib/index.umd.js"></script>

<script>
marked.use(markedKatex({
  throwOnError: false
}));

const base =
  "https://raw.githubusercontent.com/moyarzoca/PaillacoDiff/refactor/public-api/";

const documents = [
  base + "README.md",
  base + "docs/reference.md",
  base + "docs/conventions.md"
];

Promise.all(
  documents.map(url =>
    fetch(url).then(response => response.text())
  )
).then(documents => {
  const container = document.getElementById("paillacodiff-docs");

  container.innerHTML =
    documents
      .map(markdown => marked.parse(markdown))
      .join("<hr>");

  Prism.highlightAllUnder(container);
});
</script>
