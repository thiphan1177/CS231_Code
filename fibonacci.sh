#! /bin/bash                                                                           
# fib.sh                                                                               
# Thao phan                                                                            
# outputs Fibonacci numbers < 100                                                      

fibn=0
fibn_1=1

for i in `seq 11` ; do
   fibn_2=$fibn_1
   fibn_1=$fibn

   #update fibn                                                                        
   fibn=$(( $fibn_1 + $fibn_2 ))

   # print out Fibn numbers                                                            
   if [ $fibn -lt "100" ] ; then
       echo $fibn
   fi
done