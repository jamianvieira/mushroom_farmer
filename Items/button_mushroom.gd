extends MyItem

func _ready():
	super()
	item_name = "button_mushroom"
	
func _on_body_entered(body):
	picked_up.emit(item_name, $Sprite2D)
	queue_free()
