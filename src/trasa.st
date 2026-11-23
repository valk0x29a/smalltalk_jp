Object subclass: Trasa [
    | etapy |

    initialize [
        etapy := OrderedCollection new.
    ]

    Trasa class >> new [
        |op|
        op := super new.
        op initialize.
        ^op
    ]

    odcinki [
        ^etapy
    ]

    dodaj: odcinek [
        (odcinek isKindOf: OdcinekPodrozy)
            ifTrue: [ etapy add: odcinek ]
            ifFalse: [ self error: 'Dodany obiekt nie jest Odcinkiem!' ].
    ]

    dodajWszytskie: drugi [
        (drugi isKindOf: OrderedCollection)
            ifTrue: [ etapy addAll: drugi]
            ifFalse: [ 
                (drugi isKindOf: Trasa)
                    ifTrue: [ drugi addAll: drugi odcinki]
                    ifFalse: [ 
                        self error: 'Dodany obiekt nie jest ani OrderedCollection, ani Trasą!' 
                    ].
            ].
    ]

    error: blad [
        Transcript show: 'Błąd w Trasie: ', blad; cr.
    ]

    + drugi [
        (drugi isKindOf: OdcinekPodrozy)
            ifTrue: 
            [
                | wynik |
                wynik := Trasa new.
                wynik dodajWszytskie: etapy.
                wynik dodaj: drugi.
                ^wynik
            ]
            ifFalse: [ 
                (drugi isKindOf: Trasa)
                    ifTrue:
                    [
                        | wynik |
                        wynik := Trasa new.
                        wynik dodajWszytskie: etapy.
                        wynik dodajWszytskie: drugi odcinki.
                        ^wynik
                    ]
                    ifFalse: [ self error: 'Drugi obiekt nie jest ani Trasą ani Odcinkiem!!!'].
            ].
        
    ]


    dystans [
        | suma |
        suma := 0.
        etapy do: [ :odcinek | suma := suma + odcinek dystans ].
        ^suma
    ]

    czas [
        | suma |
        suma := 0.
        etapy do: [ :odcinek | suma := suma + odcinek czas ].
        ^suma
    ]

    koszt [
        | suma |
        suma := 0.
        etapy do: [ :odcinek | suma := suma + odcinek koszt ].
        ^suma
    ]

    emisjaCO2[
        | emisja |
        emisja := 0.
        etapy do: [ :odcinek | emisja := emisja + odcinek emisjaCO2 ].
        ^emisja
    ]

    drukuj[
        '--------- TRASA ---------' displayNl.
        etapy keysAndValuesDo: [ :i :odcinek |
            (i printString, '. ') display.
            odcinek opis.
        ].
        '-------------------------' displayNl.
        ('Dystans: ', (self dystans) printString, ' km') displayNl.
        ('Czas: ', (self czas) printString, ' min') displayNl.
        ('Koszt: ', (self koszt) printString, ' zł') displayNl.
        ('Łączna emisja CO2: ', (self emisjaCO2) printString, ' kg') displayNl.
        '-------------------------' displayNl. '' displayNl.
    ]

    porownajEmisje: drugi [
        (drugi isKindOf: Trasa)
            ifTrue: [
                | e1 e2 |
                e1 := self emisjaCO2.
                e2 := drugi emisjaCO2.
                (e1 < e2)
                    ifTrue: ['Pierwsza trasa jest mniej emisyjna.' displayNl]
                    ifFalse: [
                        (e1 > e2)
                            ifTrue: ['Druga trasa jest mniej emisyjna.' displayNl]
                            ifFalse: ['Obie trasy są tak samo emisyjne.' displayNl].
                    ].
            ]
            ifFalse: [self error: 'Drugi obiekt nie jest Trasą!!!'].
    ]
]   