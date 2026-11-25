Object subclass: OdcinekPodrozy [
    |dystans punktPoczatkowy punktKoncowy czas koszt typ czas_przesiadki opoznienie |
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

    mozeMiecOpoznienie [ ^true ]

    ustawOpoznienie: minuty [
        (self mozeMiecOpoznienie)
            ifTrue: [ opoznienie := minuty ]
            ifFalse: [ ('') ].
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
            ifFalse: [ ('Opoznienie: ', opoznienie printString, ' min') displayNl. ].
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
        czas := (dystans/5)*60 + opoznienie.
    ]

    emisjaCO2[
        ^dystans * 0.0.
    ]

    mozeMiecOpoznienie[ ^false ]
]

OdcinekPodrozy subclass: OdcinekAutobusowy[
    initialize [
        super initialize.
        typ := 'autobusem'.
        koszt := 2.
        opoznienie := (0 to: 120) atRandom.
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
        czas := (dystans/20)*60.
    ]

    emisjaCO2[
        ^dystans * 0.0.
    ]

    mozeMiecOpoznienie[ ^false ]
]

OdcinekPodrozy subclass: OdcinekTramwajowy[
    initialize [
        super initialize.
        typ := 'tramwajem'.
        koszt := 2.
        opoznienie := (0 to: 120) atRandom.
        czas := (dystans/50)*50.
        czas_przesiadki := (1 to: 5) atRandom.
    ]

    emisjaCO2[
        ^dystans * 0.05.
    ]
]

