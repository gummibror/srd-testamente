---
nav_exclude: true
---

## Manuellt

Jag tror det enklaste är att kopiera filena från "latexfiler" till overleaf och manuellt ändra datum och sådant för att göra kallelsen. Annars finns ett script jag gjort också.

Overleaf behöver inte nödvändigtvis tycka om Å, Ä och Ö så kolla att det är helt rätt på kallelsemallen för det ledde till lite roliga grejer för mig.

## Automatiskt

    *   Fyll i punkterna du vill ha på vars en rad i filen "nextmeet"
    *   Var på en linuxdator (för mac kör brew install coreutils, windows går ej)
*   Ha pdflatex installerat (googla om du inte har det)
    *   kör `./genKallelse.sh` eller `bash genKallelse.sh` i denna mappen och se magin hända
