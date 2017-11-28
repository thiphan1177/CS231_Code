# hw4c.sh                                                                                  
# Thao Phan  
# my program does use 3 nested for loops

for i in 2 3 ; do
for j in `seq 5` ; do
for k in `seq $j` ; do
echo -n $i
done
echo ""
done
echo ""
done

for a in `seq 5` ; do
for b in `seq $a` ; do
echo -n "1"
done
echo ""
done

echo ""

for c in `seq 5` ; do
for d in `seq $c` ; do
echo -n "a"
done
echo ""
done

echo ""