# Forelesningsplan F19–F22: PDE-kapittelet (nytt opplegg)

Henviser til delkapitler i `Kompendium/3_PDE.tex` (kapittel 3, §3.1–§3.3).
Endeligvolum-metode (§"Numeriske metoder: Endeligvolum-metode" og utover,
tema for øving 7) er **ikke** del av F19–F22 og er ikke rørt.

---

## F19 — PDEer generelt (ingen numerikk)

Kompendium: hele **§3.1 "Introduksjon til PDE"** og **§3.2 "Bevaringslover: Varmeligning"**.

- §3.1 Vanlige typer av 2. ordens PDE
  (inkl. utledning av bølgelikningen fra Maxwells likninger og for en vibrerende streng)
- §3.1 Separable løsninger og superposisjon
  (separasjon av variable for bølge-/varmelikningen, stående bølger, flere romdimensjoner)
- §3.1 Initial- og randbetingelser for PDE
- §3.2 Bevaringslover / utledning av varmeligningen: energibevaring, grunnleggende
  relasjoner, rand-/initialbetingelser, dimensjonsløs form, forenklede/lineære modeller,
  ikke-lineære ligninger og linearisering (inkl. kort merknad om andre bevaringslover)

Ingen kode denne uka.

---

## F20 — Numerikk del 1: Endelige differanser, 1D randverdiproblem, iterasjon

Kompendium: **§3.3 "Numeriske metoder: Endelige differanser"**, t.o.m. Neumann-seksjonen.

- Approksimasjon av deriverte (fremover-, bakover- og sentraldifferanse, differanseformel for andrederiverte)
- To-punkts randverdiproblem med Dirichlet-betingelser (+ implementering i Python)
- Iterative metoder: Jacobi- og Gauss-Seidel-iterasjon
- To-punkts randverdiproblem med Neumann-betingelser

Kode:
- `IMAA3012_TeachingMaterial/F20a_Differanseapproksimasjoner_Deriverte.ipynb` -- demonstrerer fremover-,
  bakover- og sentraldifferanse (geometrisk som sekantlinjer, og numerisk som $O(h)$ vs. $O(h^2)$-konvergens),
  samt differanseformelen for $f''(x)$.
- `IMAA3012_TeachingMaterial/F20b_Endelige_Differanser_Jacobi_GaussSeidel.ipynb` -- direkte løsning,
  Jacobi- og Gauss-Seidel-iterasjon for 1D RVP (bygger på F20a).

---

## F21 — Numerikk del 2: 2D randverdiproblemer og 2D varmeligning

- To-dimensjonale randverdiproblemer: Laplace- og Poisson-likningen
  (5-punkts stencil, Jacobi/Gauss-Seidel, posisjonsavhengig/stykkevis Dirichlet-rand)
- Et PDE-eksempel: numerisk løsning av varmeligningen, inkl. utvidelsen
  "To romdimensjoner" (eksplisitt Euler, stabilitet $r\le 1/4$)

Kode: `IMAA3012_TeachingMaterial/F21_2D_Laplace_Poisson_Varme.ipynb`

---

## F22 — Numerikk del 3: Leapfrog-metoden for bølgelikningen

- Leapfrog-metoden for bølgelikningen: utledning av skjemaet, oppstart ved
  Taylorpolynomet av andre grad, randbetingelser (Dirichlet og periodisk),
  CFL-stabilitet ($r\le 1$ i 1D), og utvidelsen til to romdimensjoner ($r\le 1/\sqrt2$)

Kode: `IMAA3012_TeachingMaterial/F22_Leapfrog_Bolgelikning.ipynb`

---

