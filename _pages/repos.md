---
title: "Selected repositories"
permalink: /repos/
layout: single
author_profile: true
---

{% include toc %}

$$
\newcommand{\dd}{\mathrm{d}}
$$

## PaillacoDiff

`PaillacoDiff` is Wolfram Mathematica package written by myself that allow to do computations of (pseudo-)Riemannian geometry and differential forms for a given chart. Here is the [GitHub Repo.](https://github.com/moyarzoca/PaillacoDiff)

For instance, if you have coordinates $$x^\mu = (t,r,x,y)$$ on a given manifold, you have a basis of the 1-form space $$\dd x^\mu$$ and you can construct higher-degree forms using the wedge product. This can be done in a practical way by defining the exterior derivative $$\dd$$, which takes a $$p$$-form and returns a $$(p+1)$$-form. Acting on the coordinates it will give you the basis for the 1-forms.

In `PaillacoDiff` package, the exterior derivative is hardcoded with the letter `d`, and it assumes that all symbols are not constants. To declare that a symbol `c` is constant we do `d[c]= 0`. Therefore, you can use any symbol as the coordinates of the spacetime and to construct the 1-form basis you simply act with the exterior derivative.
```mathematica 
(*Example:*)
Print[FormDegree[d[x]]];
(*Return 1*)
Print[d[d[x]]];
(*Return 0*)
```
In the snipped we present the function `FormDegree`, that returns the degree of the object. And we have shown that the exterior derivative defined by `PaillacoDiff` is nilpotent on any symbol `x`.

In addition to this, `PaillacoDiff` handles the Wedge product with differential forms. In Mathematica the wedge operation is realized by `\[Wedge]` or by pressing `Esc` + `^` + `Esc`. Then, for instance
```mathematica
(*Example:*)
Print[FormDegree[d[x] \[Wedge] d[y]]];
```
returns 2.

These are the basics of `PaillacoDiff`, this is how it was thought. On the top of these basics, one can build additional structure such as 
- Metric
- Riemann tensor
- Hodge star
- Vielbein basis
- spin connection
- Curvature 2-form
- Contraction operator

Among other things. If you understand this small piece of ideas that I try to persure with `PaillacoDiff` I encorage you to clone or download the repo and play with it!

---

## TensoXport


---

## PhD thesis

