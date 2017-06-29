import json

# Store the values of the unique 
# ID of your chat mates
names = {'U5D5UAT1S':'adithyabhatk', 
	'U5AUG5J8Y':'adwait1_g', 
	'U5E8J6VAA':'amalbyju98',
	'U5D9T35QE':'anusha',
	'U5C5G61MH':'architp4ndey',
	'U5BFS7Q2X':'aryanhimanshu',
	'U5EEPUZ36':'ashrit26',
	'U5DTWKZQW':'chinmay_dd',
	'U5DCK8ZDX':'gauravud',
	'U5B3HALU9':'gautamrk',
	'U5CCP7CJK':'gpn',
	'U5B105XAM':'himadrip',
	'U5C2P3WMR':'jeshventh',
	'U5D4CKCEN':'kbhat',
	'U5CELUGEP':'mat123',
	'U5B85LK4H':'mnaveenkumar2009',
	'U5BNQKM53':'nihalh55',
	'U5DMZS4F8':'supreethg',
	'U5BJ0QQE6':'suraj7',
	'U5ATP83CG':'surajsingh',
	'U5CCNE9P1':'swathi',
	'U5BJ1UXQA':'tk11',
	'U5C8VSK61':'varsha_subbaram',
	'U5BG59UBA':'vilas'
	}

# Open and read the file
with open('2017-06-19.json') as json_file:
	data = json.load(json_file)
	for p in data:
		print(names[p['user']] + " : " + p['text'])
print("")
