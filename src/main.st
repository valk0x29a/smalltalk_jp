| odcinek1 odcinek2 odcinek3 trasa cala_trasa |

FileStream fileIn: 'opoznienia.st'.
FileStream fileIn: 'odcinek.st'.
FileStream fileIn: 'trasa.st'.

odcinek1 := OdcinekPieszy new
    initDystans: 2;
    initpunktPoczatkowy: 'uczelnia';
    initpunktKoncowy: 'przystanek1';
    initialize;
    yourself.


odcinek2 := OdcinekAutobusowy new
    initDystans: 40;
    initpunktPoczatkowy: 'przystanek1';
    initpunktKoncowy: 'przystanek2';
    initialize;
    yourself.


odcinek3 := OdcinekRowerowy new
    initDystans: 1;
    initpunktPoczatkowy: 'przystanek2';
    initpunktKoncowy: 'przystanek3';
    initialize;
    yourself.

odcinek4 := OdcinekTramwajowy new
    initDystans: 35;
    initpunktPoczatkowy: 'przystanek3';
    initpunktKoncowy: 'dom';
    initialize;
    yourself.



"odcinek1 opis.
odcinek2 opis.
odcinek3 opis.
odcinek4 opis."

trasa1 := odcinek1 + odcinek2.
trasa2 := odcinek3 + odcinek4.
cala_trasa := trasa1 + trasa2. 
trasa := trasa1 + odcinek3.
trasa := odcinek4 + trasa2.


trasa1 drukuj.
trasa2 drukuj.

trasa1 porownajEmisje: trasa2.

'' displayNl.