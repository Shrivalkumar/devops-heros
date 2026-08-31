sum=0

read -p "give your number" num
for ((i=1; i<=num; i++))
do
    echo "this is the $i iteration"
    sum=$((sum+i))
done

echo $sum