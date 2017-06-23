d=[3,22,99,68,34,17,45,66,58,89,73,12,92,1,5,26,91,32,86]
print d,'\n'
p=len(d)
bin_size=raw_input('Choose the bin_size(Eg:9) ')

for i in range(int(min(d)),int(max(d)),int(bin_size)+1):
	print "{:>4} - {:<4}".format(i,i+int(bin_size)),' ',
	for j in range(0,p):
		if d[j]>=i and d[j]<=i+int(bin_size):
			print '-',
	print '\n'