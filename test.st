Object subclass: OdcinekPodrozy [
    | minuty |
    OdcinekPodrozy class >> new [
        |op|
        op := super new.
        op ustawCzas: 0.
        ^op
    ]

    + drugi [
        minuty := minuty + drugi czas.
    ]

    ustawCzas: liczba [
        minuty := liczba.
    ]
    czas [ ^minuty ]
]


