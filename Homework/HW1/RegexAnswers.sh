#Priyanka Karki
#CSCI 3308-201

printf "Q1: " 
grep -E "\d\$" "$1" | wc -l 

printf "Q2: " 
grep -E "^[aeiouy]" "$1" | wc -l 
# grep -E "^[aeiou]" "$1" | wc -l

printf "Q3: " 
grep -E "^.[a-zA-Z]{9}$" "$1" | wc -l 

printf "Q4: " 
grep -E "\d\-\d" "$1" | wc -l 

printf "Q5: " 
grep -E 303- "$1" | wc -l 

printf "Q6: " 
grep -E "^[0-9]+[aeiouy]$" "$1" | wc -l 

printf "Q7: " 
grep -E "\UCDenver.edu" "$1" | wc -l 

printf "Q8: " 
grep -E "^[n-zN-Z].*\..*@" "$1" | wc -l 