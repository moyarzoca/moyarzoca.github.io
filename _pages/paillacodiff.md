---
permalink: /paillacodiff/
title: "PaillacoDiff"
author_profile: false
layout: single
---

<div id="paillacodiff-docs">
  Loading documentation...
</div>

<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>

<script>
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
  document.getElementById("paillacodiff-docs").innerHTML =
    documents.map(markdown => marked.parse(markdown)).join("<hr>");
    
  if (window.MathJax) {
    MathJax.typesetPromise();
  }
});
</script>
