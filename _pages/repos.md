---
permalink: /repos/
title: "Selected repositories"
author_profile: true
layout: single
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


## TensorXport

`TensorXport` is a Mathematica module I wrote for **xAct**, created to address the need to write xAct tensors in **Maple** with [GRTensorIII](github.com/grtensor/grtensor), which can sometimes be faster for algebraic manipulations. The repository is [here](https://github.com/moyarzoca/TensorXport). The two main functionalities are:

- **`ToGRTensor`**: Converts xAct expressions into GRTensor Maple strings for easy export.  
- **`IntegrateByParts`**: Performs integration by parts on expressions quadratic in the perturbation `hh` with covariant derivatives `CD`.

> **Note:** Covariant derivative and perturbation names are hardcoded.

---

### Key Features

1. **Export xAct expressions**:  
```mathematica
ToGRTensor[expr]
````

2. **Integrate by parts** with a defined boundary context:

```mathematica
DefTensor[norm[a], M]
boundyContext = SetNormalVector[norm, M];
IntegrateByParts[boundyContext][expr]
```

3. **Extract differential operators** from quadratic perturbation terms:

```mathematica
DefTensor[auxH[-a,-b], M, Symmetric[{-a,-b}]];
ExtractOperator[auxH[-a,-b]][hDh]
```

---

`TensorXport` streamlines xAct workflows, making it easier to export, manipulate, and analyze perturbative expressions in Maple and Mathematica.

```

This keeps **everything essential**: what the module does, the main functions, and example usage, but avoids step-by-step verbose instructions.  

---
