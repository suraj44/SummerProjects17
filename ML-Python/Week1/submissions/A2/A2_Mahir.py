data = [1,2,2,5,8,10,4,7,1,1,3,2,6,9,10,10,8,10]
l = 1
u = 2

def printbar(count,l,u):
    print l,"to",u,
    for i in range(count):
        print '-',


while u < 11:
    count = 0
    diff = u-l
    for item in data:
        if item <= u and item >=l:
            count += 1
    printbar(count,l,u)
    print '\n'
    u = u + diff + 1
    l = l + diff + 1

l = 1
u = 3
while u < 13:
    count = 0
    diff = u-l
    for item in data:
        if item <= u and item >=l:
            count += 1
    printbar(count,l,u)
    print '\n'
    u = u + diff + 1
    l = l + diff + 1