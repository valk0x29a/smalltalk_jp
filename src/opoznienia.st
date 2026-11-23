Object subclass: Opoznienie[
    | temat minuty |

    initialize[
        minuty := 0.
    ]

    temat: tekst[
        temat := tekst.
    ]

    minuty[
        ^minuty
    ]

    powod[
        ^temat
    ]

    sprawdz[
        | losowa |
        losowa := (1 to: 2) atRandom.
        (losowa = 1)
            ifTrue: [
                minuty := (10 to: 120) atRandom.
                (minuty printString , ' min opoznienia przez ' , temat) displayNl.
            ]
            ifFalse: [ minuty := 0 ].
    ]
]

Opoznienie subclass: OpoznienieAutobusu[
]

Opoznienie subclass: OpoznieniePiesze[
]

Opoznienie subclass: OpoznienieRowerowe[
]