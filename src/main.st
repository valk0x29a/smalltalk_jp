
| odcinek1 odcinek2 odcinek3 trasa cala_trasa|

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
    initpunktKoncowy: 'dom';
    initialize;
    yourself.



odcinek1 opis.
odcinek2 opis.
odcinek3 opis.

trasa := odcinek1 + odcinek2.
cala_trasa := trasa + odcinek3. 


trasa drukuj.
cala_trasa drukuj.

cala_trasa porownajEmisje: trasa.

'' displayNl.

" cala_trasa := trasa + 7.

| a b c d lewa prawa dluzsza calosc sprawdz blad |
" " sprawdz := [ :warunek :opis |
warunek ifFalse: [ Error signal: opis ] ].
a := OdcinekPodrozy new ustawCzas: 5.
b := OdcinekPodrozy new ustawCzas: 10.
c := OdcinekPodrozy new ustawCzas: 15.
d := OdcinekPodrozy new ustawCzas: 20.
lewa := a + b.
prawa := c + d.
dluzsza := lewa + c.
calosc := lewa + prawa. "
" sprawdz value: (lewa isKindOf: Trasa) value: 'Typ wyniku'.
sprawdz value: (dluzsza odcinki asArray = (Array with: a with: b with: c))
value: 'Trasa + odcinek'.
sprawdz value: (calosc odcinki asArray = (Array with: a with: b with: c with:
d))
value: 'Trasa + trasa'.
sprawdz value: (lewa odcinki asArray = (Array with: a with: b))
value: 'Zmieniona lewa trasa'.
sprawdz value: (prawa odcinki asArray = (Array with: c with: d))
value: 'Zmieniona prawa trasa'.
blad := false. 
[ lewa + 7 ] on: Error do: [ :e | blad := true ].
sprawdz value: blad value: 'Brak bledu dla liczby'.
Transcript show: 'OK'; cr.  "