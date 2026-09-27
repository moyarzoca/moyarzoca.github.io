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
fetch("https://raw.githubusercontent.com/moyarzoca/PaillacoDiff/main/README.md")
  .then(response => response.text())
  .then(markdown => {
    document.getElementById("paillacodiff-docs").innerHTML =
      marked.parse(markdown);

    if (window.MathJax) {
      MathJax.typesetPromise();
    }
  });
</script>
