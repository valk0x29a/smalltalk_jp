Object subclass: OdcinekPodrozy [
    |dystans punktPoczatkowy punktKoncowy czas koszt typ| 
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
        ('Podroz zajmie ', (self czas) printString, ' min ', typ) displayNl.
    ]

    opis[
        self wypiszCzas.
        ('koszt: ', (self koszt) printString) displayNl.

    ]

      
]

OdcinekPodrozy subclass:OdcinekPieszy[
    initialize [
        super initialize.
        typ := 'pieszo'.
        koszt := 0.
        czas := (dystans/5)*60.
    ]


   

    
]

OdcinekPodrozy subclass:OdcinekAutobusowy[
    initialize [
        super initialize.
        typ := 'autobusem'.
        koszt := 2.
        czas := (dystans/50)*60.
    ]

  

    
]

OdcinekPodrozy subclass:OdcinekRowerowy[
    initialize[
        super initialize.
        typ := 'rowerem'.
        koszt := 1.
        czas := (dystans/20)*60.
    ]
    
]