---
permalink: /conventions/
title: "Conventions"
author_profile: true
layout: single
---

{% include toc %}

$$
\newcommand{\dd}{\mathrm{d}}
$$

Conventions are subtle and often arbitrary when we talk about differential geometry and supergravity. You can find here the conventions that I *usually* use on my notes and I have used on some papers that I have co-authored.


## Differential geometry conventions

Let us consider a \\(d\\)-dimensional manifold \\(\mathscr{M}\\) endowed with a vielbein, a spin connection and a flat metric \\((V^{a},\omega^{ab},\eta_{ab})\\).
The number of minus signs in the metric signature is denoted by \\(\eta_{-}\\). Given a \\(p\\)-form

$$
\displaylines{
F_{p}  =\frac{1}{p!}F_{a_{1}\dots a_{p}}V^{a_{1}}\wedge\dots\wedge V^{a_{p}}\,,
}
$$

its Hodge star is

$$
\displaylines{
\star F =\frac{1}{(d-p)!p!}F^{a_{1}\dots a_{p}}\epsilon_{a_{1}\dots a_{p}b_{1}\dots b_{d-p}}V^{b_{1}}\wedge\dots\wedge V^{b_{d-p}}\,.
}
$$

The \\(\epsilon_{a_{1}\dots a_{d}}\\) is normalized as \\( \epsilon_{12\dots d}=1\\). The fully contravariant symbol \\(\epsilon^{a_{1}\dots a_{d}}\\) is *independently* normalized by \\(\epsilon^{12\dots d}=1\\). 

The generalized Kronecker delta is defined by

$$
\displaylines{
\delta_{a_{1}\dots a_{p}}^{b_{1}\dots b_{p}} =p!\delta_{[a_{1}}^{[b_{1}}\dots\delta_{a_{p}]}^{b_{p}]}\,,
}
$$

and as usual $A_{[ab]}=\frac{1}{2}(A_{ab}-A_{ba})$. Then, for the generalized Kronecker delta with rank equal to the dimension of the spacetime

$$
\displaylines{
\delta_{a_{1}\dots a_{d}}^{b_{1}\dots b_{d}} =\epsilon^{b_{1}\dots b_{d}}\epsilon_{a_{1}\dots a_{d}}\,.
}
$$

Contraction of the generalized Kronecker delta are

$$
\displaylines{
\delta_{b_{1}\dots b_{k}c_{k+1}\dots c_{p}}^{a_{1}\dots a_{k}c_{k+1}\dots c_{p}} =\frac{(d-k)!}{(d-p)!}\delta_{b_{1}\dots b_{k}}^{a_{1}\dots a_{k}}\,.
}
$$

---
