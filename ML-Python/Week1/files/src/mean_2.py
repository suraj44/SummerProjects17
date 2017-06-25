data = [255, 168, 125, 11102, 59, 120, 500, 2, 98, 25]
sum = 0.0
n = len(data)

for i in data:
	sum += i

meanvalue = sum/n

print "Mean: ", meanvalue
print "Mean: %4.2f"%(meanvalue)
print "Mean: {:>6} {:<6}here".format(int(meanvalue), int(meanvalue))
print "Mean: {1} {0}".format(meanvalue, int(meanvalue))
