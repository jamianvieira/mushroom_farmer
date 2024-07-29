extends Area2D
class_name MyItem

var item_name : String
signal picked_up(item_name: String, sprite: Sprite2D)
var inventory

func _ready():
	inventory = get_tree().get_first_node_in_group("GUI").get_node("Inventory")
	picked_up.connect(inventory.item_pick_up)

func pick_up(item_name, sprite):
	picked_up.emit(item_name, sprite)
	queue_free()

func click_pick_up(item_name, sprite, event):
	if event is InputEventMouseButton and event.pressed:
		print("clicked")
		picked_up.emit(item_name, sprite)
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
