Object subclass: OdcinekPodrozy [
    |dystans punktPoczatkowy punktKoncowy czas koszt typ opoznienie1 opoznienie2|
    initialize [
        czas := 0.
        typ := 'none'.
        koszt := 0.
    ]

    initDystans: km [
        dystans := km.
    ]

    initpunktKoncowy: pk [
        punktKoncowy := pk.
    ]

    initpunktPoczatkowy: pp[
        punktPoczatkowy := pp.

    ]

    ustawCzas: minuty [
        czas := minuty
    ]


    dystans[
        ^dystans
    ]

    punktKoncowy[
        ^punktKoncowy
    ]

    punktPoczatkowy[
        ^punktPoczatkowy
    ]
    koszt[
       ^koszt
    ]

    czas[
       ^czas
    ]

    wypiszCzas[
        ('Podroz zajmie ', (self czas) printString, ' min ', typ) display.
    ]

    opis[
        self wypiszCzas. ', ' display.
        ('koszt: ', (self koszt) printString, ' zł') displayNl.

    ]


    error: blad [
        Transcript show: 'Błąd w Odcinku: ', blad; cr.
    ]

    + drugi [
        (drugi isKindOf: OdcinekPodrozy)
            ifTrue:
            [
                |wynik|
                wynik := Trasa new.
                wynik dodaj: self.
                wynik dodaj: drugi.
                ^wynik
            ]
            ifFalse:
            [
                (drugi isKindOf: Trasa)
                    ifTrue:
                    [
                        |wynik|
                        wynik := Trasa new.
                        wynik dodaj: self.
                        wynik dodajWszytskie: drugi odcinki.
                        ^wynik
                    ]
                    ifFalse: [self error: 'Drugi obiekt nie jest ani Trasą ani Odcinkiem!!!'].
            ]
    ]
]

OdcinekPodrozy subclass: OdcinekPieszy[
    initialize [
        super initialize.
        typ := 'pieszo'.
        koszt := 0.
        opoznienie1 := OpoznieniePiesze new.
        opoznienie1 temat: 'roboty drogowe na chodniku'.
        opoznienie2 := OpoznieniePiesze new.
        opoznienie2 temat: 'burza'.
        opoznienie1 sprawdz.
        opoznienie2 sprawdz.
        czas := (dystans/5)*60 + opoznienie1 minuty + opoznienie2 minuty.
    ]
]

OdcinekPodrozy subclass: OdcinekAutobusowy[
    initialize [
        super initialize.
        typ := 'autobusem'.
        koszt := 2.
        opoznienie1 := OpoznienieAutobusu new.
        opoznienie1 temat: 'korek'.
        opoznienie2 := OpoznienieAutobusu new.
        opoznienie2 temat: 'autobus nie przyjechal'.
        opoznienie1 sprawdz.
        opoznienie2 sprawdz.
        czas := (dystans/50)*60 + opoznienie1 minuty + opoznienie2 minuty.
    ]
]

OdcinekPodrozy subclass: OdcinekRowerowy[
    initialize[
        super initialize.
        typ := 'rowerem'.
        koszt := 1.
        opoznienie1 := OpoznienieRowerowe new.
        opoznienie1 temat: 'spadl lancuch'.
        opoznienie2 := OpoznienieRowerowe new.
        opoznienie2 temat: 'brak sciezki rowerowej'.
        opoznienie1 sprawdz.
        opoznienie2 sprawdz.
        czas := (dystans/20)*60 + opoznienie1 minuty + opoznienie2 minuty.
    ]
]