# /bin/bash
# teller.sh, lab#6
# Thao Phan
# Given a number on the command line, this program treats the number as an amount of money, 
#   which it breaks down into a number of $ 20-bills, $10-bills, $5-bills, and $1-bills. It 
#   outputs the number of 20s, the number of 10s, the number of 5s, and the number of 1s

# get number from user 
number=$1

# Break down the number

bills_20=$( expr $number / 20 )
bills_20_remainder=$( expr $number % 20 )
# echo "bills_20_remainder is $bills_20_remainder"
bills_10=$( expr $bills_20_remainder / 10 )

# echo "bills_10 is $bills_10"
bills_10_remainder=$( expr $bills_20_remainder % 10 )
# echo "The remainder is $bills_10_remainder"

bills_5=$( expr $bills_10_remainder / 5 )
bills_5_remainder=$( expr $bills_10_remainder % 5 )
bills_1=$( expr $bills_5_remainder / 1)

# Output bills and amounts of each
echo $bills_20
echo $bills_10
echo $bills_5
echo $bills_1	 	  	 	 		     	      	      	  	 	
