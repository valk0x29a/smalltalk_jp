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
]   