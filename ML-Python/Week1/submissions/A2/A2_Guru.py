# Written in Python3
# Works for any integral data set... hopefully

def table(data,size):
    n = min(data)
    m = max(data) + size
    frequency = [[] for i in range(2)]

    while n < m:
        r = range ( n, n + size)
        count = 0
        frequency[0].append(r)
        for j in data:
            if j in r:
                count+=1
        frequency[1].append(count)
        n = n + size
    return frequency

def histogram(frequency):
    print ("\n\n\t HISTOGRAM \n\n")
    n = len(frequency[0])
    for i in range(0,n):
        print (frequency[0][i],end="\t")
        for j in range(0,frequency[1][i]):
            print ("-", end="")
        print("\n")


s = input("\n\nEnter a list of numbers ==> ")
data = list(map(int,s.split()))
size = int(input("\nEnter Class size ==> "))
freq = table(data,size)
histogram(freq)
