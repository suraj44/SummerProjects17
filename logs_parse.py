import json

# Store the values of the unique 
# ID of your chat mates
# names = {'U530UCFTL':'hrily', 
# 	'U55UB6X9P':'nachiket', 
# 	'U57AA2TEK':'priyam',
# 	'U579Y5A7Q':'hlpr98',
# 	'U56JCBFA9':'anumeha29',
# 	'U56DHFD99':'rosag31',
# 	'U52A977UG':'salman-bhai',
# 	'U55UC8R09':'ckbs',
# 	'U56H3SYJG':'kenichi',
# 	'U55UE0J9F':'ram_aditya',
# 	'U55UDASSV':'bhavishya',
# 	'U531L233L':'vilas',
# 	'U57A20DSS':'ishaan',
# 	'U55UJ9MH7':'rithesh'
# 	}

# Open and read the file
with open('2017-04-29.json') as json_file:
	data = json.load(json_file)
	for p in data:
		print(names[p['user']] + " : " + p['text'])
		print("")

