extends Area2D
class_name MyItem

var item_name : String
signal picked_up(item_name: String)
var player : Player

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	picked_up.connect(player.item_pick_up)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
