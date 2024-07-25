extends MyItem

func _ready():
	super()
	item_name = "crimini_mushroom"
	
func _on_body_entered(body):
	picked_up.emit(item_name)
	queue_free()
