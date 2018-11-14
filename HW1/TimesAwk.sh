#Priyanka Karki
#CSCI 3308-201

awk 'BEGIN {FS=OFS}{sum=0; n=0; for(var=2;var<=NF;var++){sum+=$var; ++n}print $1, "["int(sum/3)"]", $3","$2}' "$1"