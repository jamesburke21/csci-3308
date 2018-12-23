#Priyanka Karki
#CSCI 3308-201

# cat "$1"
echo "$(sort -b -k3,3 -k2,2 $1)" > "$1"

ave=0
while read a b c d f g
do
	sum=$(($d+$f+$g))
	ave=$(($sum/3))
	echo $a [$ave] $c,$b
done < "$1"
