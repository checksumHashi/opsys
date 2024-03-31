#!/usr/bin/env bash

# NAPOMENA, OVAJ ZADATAK SAM URADIO SA AWK, NE SED, ZATO STO JE SED KOMPLIKOVAN I MRZI ME
# E SAD, DAL TI SMES AWK DA KORISTIS UMESTO SED, NEMAM POJMA

# ovo iznad sa #! pises na pocetku svake bash skripte
# da kad bi ga pokrenuo, linux zna sta hoces da izvrsi kod
# u ovo slucaju, linux koristi bash da izvrsi skriptu
# takodje, '#!/usr/bin/env bash' je ekvivalentno '#!/bin/bash'

cat events.txt | awk -F'[,/]' '{print $4 "/" $3 "/" $2 "," $1}' | sort -t '/' -k 3,3n -k 2,2n -k 1,1n > temp.txt

# cat events.txt cita file, salje ga u awk
# u awk, -F definise razdvajace
# sa svim variablama sada u zasebnim objektima ($objekat)
# awk izbacuje na stdout, sto ide u stdin od sort

# u sort, takodje moze da se definise razdvajac sa -t
# tako da ce ignorisati imena dogadjaja

# u sort, -k sluzi kao kljuc za sortiranje u python-u
# odnosno, u 3,3, on sortira godinu (treci element)
# u odnosu na sve ostale trece elemente, u prevodu 3,3
# sve ovo isto vazi i za mm i dd
# takodje, dodajemo na kraju svakog num,num (3,3 npr) slovo n
# da bi sortiralo brojcano, a ne leksigraficno

# i na kraju, salji sve to sa > u temp.txt
# zasto temp? ako bih u drugoj komandi koja vraca redosled
# na pocetni koristio 'cat sorted_events ... > sorted_events.txt'
# izjebalo bi se, posto po "pravilima",
# u jednoj liniji koda ne treba citati i pisati u isti file 

# primer pogresnog koda 'cat sorted_events.txt | awk -F',' '{print $2 "," $1}' > sorted_events.txt'
#                                  ^
#                                  |
#                                  |
#                                  |

# PS: sortiramo prvo treci element (yyyy), jer ako
# bi smo krenuli od meseca ili godine ne bi bilo korektno

cat temp.txt | awk -F',' '{print $2 "," $1}' > sorted_events.txt

# na kraju prve komande, mi smo dobili tacno resenje, ali se u zadatku
# trazi da "Izlazni fajl treba da bude u sledećem formatu: naziv,dd/mm/yyyy."
# tako da sa skoro istom awk komandom zamenimo mesta i tjt

# u slucaju da ne sme da se ostavljaju privremeni file-ovi, koristiti:
# $rm temp.txt