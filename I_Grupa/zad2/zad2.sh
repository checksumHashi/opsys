#!/usr/bin/env bash

# kada zelimo nesto da unesemo u shell skriptu
# koristimo pozicionalne argumente
# odnosno kada run-ujemo shell skriptu
# bash zad2.sh pozicionalni_argument1 pozicionalni_element2
# mi cemo onda u skripti imati sacuvane variable koje
# glase $1=pozicionalni_argument1, $2=pozicionalni_element2

# takodje, ako celimo da run-ujemo skriptu bez bash nekaskripta.sh
# mozemo dodati permisije na sledeci nacin 'chmod +x zad2.sh'\
# tako da posle toga mozemo run-ovati skriptu sa './zad2'

# gcc je komanda koja kompajluje c kod u program
# -o flag oznacava kako zelimo da se izlazni program
# zove
gcc "$1" -o c_program
# tako da, da bi smo uspesno preneli kod u skriptu,
# i kompajlirali, pisemo './zad2.sh c_source.c neki_broj'
# gde je c_source.c kod od c programa, a neki_broj je broj N

N=$2

for ((i=1; i<=N; i++)); do
    output=$(./c_program)
    touch rezultatC$i.txt
    echo "$output" > rezultatC$i.txt
    sleep 4
done