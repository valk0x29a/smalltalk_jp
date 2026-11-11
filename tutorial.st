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

| pieszo autobus |
pieszo := OdcinekPodrozy new.
autobus := OdcinekPodrozy new ustawCzas: 18.
Transcript show: pieszo czas printString; cr. "0"
Transcript show: autobus czas printString; cr. "18"

OdcinekPodrozy subclass: OdcinekAutobusowy [
czas [ ^super czas + 2 ]
]

| odcinek |
odcinek := OdcinekAutobusowy new ustawCzas: 18.
Transcript show: odcinek czas printString; cr. "20"

| opis |
opis := (OdcinekAutobusowy new isKindOf: OdcinekPodrozy)
ifTrue: [ 'odcinek' ]
ifFalse: [ 'inny obiekt' ].
Transcript show: opis; cr.

| etapy czasy razem |
etapy := OrderedCollection new.
etapy add: (OdcinekPodrozy new ustawCzas: 12).
etapy add: (OdcinekPodrozy new ustawCzas: 18).
etapy do: [ :etap |
    Transcript show: etap czas printString; cr ].
czasy := etapy collect: [ :etap | etap czas ].
razem := czasy inject: 0 into: [ :suma :czas |
    suma + czas ].
Transcript show: razem printString; cr.

| a b c d lewa prawa dluzsza calosc sprawdz blad |
sprawdz := [ :warunek :opis |
warunek ifFalse: [ Error signal: opis ] ].
a := OdcinekPodrozy new ustawCzas: 5.
b := OdcinekPodrozy new ustawCzas: 10.
c := OdcinekPodrozy new ustawCzas: 15.
d := OdcinekPodrozy new ustawCzas: 20.
lewa := a + b.
prawa := c + d.
dluzsza := lewa + c.
calosc := lewa + prawa.
" sprawdz value: (lewa isKindOf: Trasa) value: 'Typ wyniku'.
sprawdz value: (dluzsza odcinki asArray = (Array with: a with: b with: c))
value: 'Trasa + odcinek'.
sprawdz value: (calosc odcinki asArray = (Array with: a with: b with: c with:
d))
value: 'Trasa + trasa'.
sprawdz value: (lewa odcinki asArray = (Array with: a with: b))
value: 'Zmieniona lewa trasa'.
sprawdz value: (prawa odcinki asArray = (Array with: c with: d))
value: 'Zmieniona prawa trasa'.
blad := false.
[ lewa + 7 ] on: Error do: [ :e | blad := true ].
sprawdz value: blad value: 'Brak bledu dla liczby'.
Transcript show: 'OK'; c "
