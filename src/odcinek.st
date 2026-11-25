Object subclass: OdcinekPodrozy [
    |dystans punktPoczatkowy punktKoncowy czas koszt typ opoznienie1 opoznienie2 czas_przesiadki opoznienie |
    initialize [
        czas := 0.
        typ := 'none'.
        koszt := 0.
        czas_przesiadki := 0.
        opoznienie := 0
    ]

    initDystans: km [
        dystans := km.
    ]

    initPunktKoncowy: pk [
        punktKoncowy := pk.
    ]

    initPunktPoczatkowy: pp[
        punktPoczatkowy := pp.

    ]

    ustawCzas: minuty [
        czas := minuty
    ]


    ustawOpoznienie: minuty [
        opoznienie := minuty
    ]

    czas_przesiadki[^czas_przesiadki]

    dystans[ ^dystans ]

    punktKoncowy[ ^punktKoncowy ]

    punktPoczatkowy[ ^punktPoczatkowy ]

    koszt[ ^koszt ]

    czas[ ^czas + opoznienie ]

    wypiszCzas[
        ('Podroz zajmie ', (self czas) printString, ' min ', typ) display.
    ]

    opis[
        self wypiszCzas. ', ' display.
        ('koszt: ', (self koszt) printString, ' zł') displayNl.
        (opoznienie = 0)
            ifTrue: []
            ifFalse: [ ('Opoznienie: ' opoznienie) displayNl. ].
        (punktPoczatkowy, ' --> ', punktKoncowy) displayNl.
        ('Dystans: ', (self dystans) printString, ' km') displayNl.
        ('Emisja CO2: ', (self emisjaCO2) printString, ' kg') displayNl. '' displayNl.
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
                        wynik dodajWszystkie: drugi odcinki.
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
        opoznienie := (0 to: 120) atRandom.
"        opoznienie1 := OpoznieniePiesze new.
        opoznienie1 temat: 'roboty drogowe na chodniku'.
        opoznienie2 := OpoznieniePiesze new.
        opoznienie2 temat: 'burza'.
        opoznienie1 sprawdz.
        opoznienie2 sprawdz."
        czas := (dystans/5)*60 + opoznienie.
    ]

    emisjaCO2[
        ^dystans * 0.0.
    ]
]

OdcinekPodrozy subclass: OdcinekAutobusowy[
    initialize [
        super initialize.
        typ := 'autobusem'.
        koszt := 2.
        opoznienie := (0 to: 120) atRandom.
"        opoznienie1 := OpoznienieAutobusu new.
        opoznienie1 temat: 'korek'.
        opoznienie2 := OpoznienieAutobusu new.
        opoznienie2 temat: 'autobus nie przyjechal'.
        opoznienie1 sprawdz.
        opoznienie2 sprawdz."
        czas := (dystans/50)*60 + opoznienie.
        czas_przesiadki := (2 to: 7) atRandom.
    ]

    emisjaCO2[
        ^dystans * 0.1
    ]
]

OdcinekPodrozy subclass: OdcinekRowerowy[
    initialize[
        super initialize.
        typ := 'rowerem'.
        koszt := 1.
        opoznienie := (0 to: 120) atRandom.
"        opoznienie1 := OpoznienieRowerowe new.
        opoznienie1 temat: 'spadl lancuch'.
        opoznienie2 := OpoznienieRowerowe new.
        opoznienie2 temat: 'brak sciezki rowerowej'.
        opoznienie1 sprawdz.
        opoznienie2 sprawdz."
        czas := (dystans/20)*60.
    ]

    emisjaCO2[
        ^dystans * 0.0.
    ]
]

OdcinekPodrozy subclass: OdcinekTramwajowy[
    initialize [
        super initialize.
        typ := 'tramwajem'.
        koszt := 2.
"        opoznienie1 := OpoznienieTramwaju new.
        opoznienie1 temat: 'wypadek tramwajowy'.
        opoznienie2 := OpoznienieTramwaju new.
        opoznienie2 temat: 'tramwaj nie przyjechal'.
        opoznienie1 sprawdz.
        opoznienie2 sprawdz."
        czas := (dystans/50)*50.
        czas_przesiadki := (1 to: 5) atRandom.
    ]

    emisjaCO2[
        ^dystans * 0.05.
    ]
]

