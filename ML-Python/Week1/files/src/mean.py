data = [255, 168, 125, 11102, 59, 120, 500, 2, 98, 25] 

sum = 0.0
n = len(data)
for i in range(n):
	sum += data[i]

meanvalue = sum/n

print "Mean: ", meanvalue