extends Node

var items : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func item_pick_up(item_name: String):
	
	if items.has(item_name):
		items[item_name] += 1
	else:
		items[item_name] = 1
	print("picked up " + item_name + " in inventory: " + str(items[item_name]))
