import json

# Store the values of the unique 
# ID of your chat mates
names = {
	'U56N7T2F8':'kaushiksk',
	'U58DY3T7A':'ag_1709',
	'U5862FK17':'mahirjain25',
	'U59H047SS':'ayush.work113',
	'U58MG330T':'piyush',
	'U58GN7DDX':'arvindsaik',
	'U58337ESC':'darshandv10',
	'U584D9FT2':'samyak',
	'U58R2AR8C':'svarshini',
	'U58NYR47L':'shashankp',
	'U59U2PEK0':'mohitreddy1996',
	'U59H7U7C6':'gtmb',
	'U586X7GLR':'anmol.jindal13',
	'U5872KL73':'gurupunskill',
	'U58R173NY':'decisiontreehugger',
	'U59J595EJ':'npsnayak',
	'U59JHRLAJ':'sanathk',
	'U59HPU5JA':'harsha_1810',
	'U5941NQQ2':'adithyabhatkajake',
	'U585LE3UZ':'sony',
	'U598HEB6Y':'swapnil8424',
	'U59T4ACNQ':'vilas',
	'U5A1FHK53':'ckeshava',
	'U5A3SFLP3':'aditya_a'
	}

# Open and read the file
with open('session0.json') as json_file:
	data = json.load(json_file)
	for p in data:
		if 'user' in p and p['user'] != 'USLACKBOT':
			print(names[p['user']] + " : " + p['text'])
			print("")

