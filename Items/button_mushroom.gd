extends MyItem

func _ready():
	super()
	item_name = "button_mushroom"
	
	
func _on_body_entered(body):
	print(item_name)
	picked_up.emit(item_name)
	queue_free()
