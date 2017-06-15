def mean(data):
	sum = 0.0
	n = len(data)
	
	for i in data:
		sum += i
	meanvalue = sum/n
	
	return meanvalue