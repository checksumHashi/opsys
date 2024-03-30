#!/usr/bin/env bash

# ovo iznad sa #! pises na pocetku svake bash skripte
# da kad bi ga pokrenuo, linux zna sta hoces da izvrsi kod
# u ovo slucaju, linux koristi bash da izvrsi skriptu
# takodje, '#!/usr/bin/env bash' je ekvivalentno '#!/bin/bash'

cat events.txt | awk -F'[,/]' '{print $4 "/" $3 "/" $2 "," $1}' | sort -t '/' -k 3,3 -k 2,2 -k 1,1 > sorted_events.txt

# cat events.txt cita file, salje ga u awk
# u awk, -F definise razdvajace
# sa svim variablama sada u zasebnim objektima ($objekat)
# awk izbacuje na stdout, sto ide u stdin od sort

# u sort, takodje moze da se definise razdvajac sa -t
# tako da ce ignorisati imena dogadjaja

# u sort, -k sluzi kao kljuc za sortiranje u python
# odnosno, u 3,3, on sortira godinu (treci element)
# u odnosu na sve ostale trece elemente, u prevodu 3,3
# sve ovo isto vazi i za mm i dd

# i na kraju, salji sve to sa > u zavrsni file


# PS: sortiramo prvo treci element (yyyy), jer ako
# bi smo krenuli od meseca ili godine ne bi bilo korektno