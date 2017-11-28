#! /bin/bash
# funcChallenge5.sh
# T. Phan
# lets user enter list of words on command line
# and reports # of times each word is found


function amtOfTimes {
   # amt="times"
    if [ "$1" -eq "0" ]; then
	amt="no times"
    else
	if [ "$1" -eq "1" ] ; then
	    amt="once"
	else 
	    if [ "$1" -eq "2" ] ; then
		amt="twice"
	    else
		amt="$1 times"
	    fi
	fi
fi
}

# loop thru all words typed on command line
for word in $@ ; do
#    echo $word
    amtAppeared=`grep -i $word Ulysses.txt | wc -l` # get number of times word occured
    amtOfTimes $amtAppeared
    echo "$word appears $amt in Ulysses.txt"
done	 	  	 	 		     	      	      	  	 	
