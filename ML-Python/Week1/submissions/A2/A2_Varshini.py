#Assignment 2 (Implementation 2)
def initHistogram(l, number):
    for i in range(number):
        l.append([])
    return l

data = [2,3,4,2,5,9,8,7,2,6]
bin_size = int(raw_input("Enter the width of each interval: "))
minimum = min(data)
maximum = max(data)
histogram = []
no_of_bars = ((maximum-minimum)/bin_size)+1

histogram = initHistogram(histogram, no_of_bars)

for value in data:
    barNumber = (value-minimum)/bin_size
    histogram[barNumber].append(value)

l = minimum
u = l+bin_size-1
for j in histogram:
    print str(l)+'-'+str(u),
    print '-'*len(j)
    l=u+1
    u=bin_size+l-1

    
        
    
    


