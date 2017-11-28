'''This program uses a loop to print the first N lines of Pascal's triangle;
The value of N is determined by the user as an input'''

# get user input as an int

n = int(input('> '))
array = [0] * 15
array[0]=1

size=n

sizes=[1, 2, 5, 10, 15]
counter=0
##for i in sizes:
##    print("n =", i)
##    while (counter<i):
##        for m in range(counter):
##            print(array[m])
##        counter=counter+1
##
##    for j in range(len(array),0, -1):
##        position = j-1 # current position in array
##        before = position-1 # position 1 before current position
##        array[position]= array[position] + array[before]
####    n=n-1

array2=[0]*15
count=0
while (n>0):
        array2[count]=array
##        print("index =", count, "array is: ",array2[count])
        for a in range(len(array),0, -1):
            position = a-1 # current position in array
            before = position-1 # position 1 before current position
            array[position]= array[position] + array[before]
        n=n-1
        count=count+1

print(array2[4])
##
##for i in sizes:
##    print("n =", i)
##    print(array2[i])
