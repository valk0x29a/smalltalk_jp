
| odcinek1 odcinek2 odcinek3 |

FileStream fileIn: 'odcinek.st'.

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