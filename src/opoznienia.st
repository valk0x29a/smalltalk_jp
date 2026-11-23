Object subclas: opznienie[
    |temat minuty|

    czas: c[
        minuty := c.
    ]

    temat: t[
        temat := t.
    ]

    minuty[
        ^minuty
    ]
    powod[
        ^temat
    ]
]

Opoznienie subclass: opoznienieAutobusu[
    |typ|
    typ = 'autobusu'
]

Opoznienie subclass: opoznieniePiesze[
    |typ|
    typ = 'piesze'
]

Opoznienie subclass: opoznienieRowerowe[
    |typ|
    typ = 'rowerowe'
]