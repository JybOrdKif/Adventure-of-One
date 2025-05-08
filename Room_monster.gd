var type = 0
var x = 0
var y = 0
var napr = 0
	
func obnul():
	type = 0
	x = 0
	y = 0
	napr = 0
func copy(kop):
	type = kop.type
	x = kop.x
	y = kop.y
	napr = kop.napr
func printm():
	print(type, ' ', x, ' ', y, ' ', napr)
