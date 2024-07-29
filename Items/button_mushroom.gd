extends MyItem

func _ready():
	super()
	item_name = "button_mushroom"
	
func _on_body_entered(body):
	pick_up(item_name, $Sprite2D)

func _on_input_event(viewport, event, shape_idx):
	click_pick_up(item_name, $Sprite2D, event)
