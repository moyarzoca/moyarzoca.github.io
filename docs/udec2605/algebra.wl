CloseG[Xdni_]:=Module[{dx, \[Chi]dndnij, Xupi,productXXij,
	commutatorXXij,CdndnUpijk,CtimesX},dx=Length@Xdni;
	\[Chi]dndnij=Activate@TensorContract[Inactive[TensorProduct][Xdni,Xdni],{{3,6},{2,5}}];
	Xupi=Inverse[\[Chi]dndnij] . Xdni;
	productXXij=Transpose[Activate[TensorContract[Inactive[TensorProduct][Xdni,Xdni],{{3,5}}]],{1,3,2,4}];
	commutatorXXij=productXXij-Transpose[productXXij,{2,1,3,4}];
	CdndnUpijk=Activate[TensorContract[Inactive[TensorProduct][commutatorXXij,Xupi],{{3,6},{4,7}}]];
	CtimesX=CdndnUpijk . Xdni;
	Return[Factor[commutatorXXij-CtimesX]===0*CtimesX]
]

com[x_,y_] := x . y-y . x;
KillingForm[gens_] := Table[Tr[h1 . h2],{h1, gens}, {h2, gens}];

Clear[GetRoots, GetRootsBundle];

GetRoots[cartan_, nocartan_] := Module[
	{ZZ, map, zeromat=ConstantArray[0, Length[cartan]]}, 
	map = Table[
				Position[nocartan, tIter][[1,1]] -> 
					Table[ZZ/.Solve[com[cIter, tIter]==ZZ*tIter][[1]], {cIter, cartan}]
			, {tIter, nocartan}];
	map = DeleteCases[map, zeromat];
	Return[Association[map]];
];
GetRootsBundle[rootsAsso_] := Module[
	{allPosibleSums, simpleroots, positiveroots, negativeroots, roots},
	roots = Values[rootsAsso];
	positiveroots = Select[roots, DeleteCases[#, 0][[1]]>0&];
	negativeroots = Complement[roots, positiveroots];
	
	allPosibleSums = Simplify[Map[Apply[Plus, #]&, Tuples[{positiveroots,positiveroots}]]];
	simpleroots = Complement[positiveroots, Intersection[allPosibleSums, positiveroots]];
	Return[<|"all"-> rootsAsso, 
	         "positive" -> Select[rootsAsso, MemberQ[positiveroots, #]&],
	         "simple" -> Select[rootsAsso, MemberQ[simpleroots, #]&],
	         "negative" -> Select[rootsAsso, MemberQ[negativeroots, #]&]|>];
];

