extends Node

var items : Dictionary = {}

func item_pick_up(item_name: String, sprite: Sprite2D):
	
	if items.has(item_name):
		items[item_name] += 1
		for child in get_parent().get_node("HBoxContainer").get_children():
			if child.get_node("ItemName").item_name == item_name:
				child.get_node("Count").text = str(items[item_name])
	else:
		items[item_name] = 1
		for child in get_parent().get_node("HBoxContainer").get_children():
			if child.get_node("SpritePlaceholder").get_child_count() == 0:
				var inventory_sprite = sprite.duplicate()
				child.get_node("SpritePlaceholder").add_child(inventory_sprite)
				child.get_node("Count").text = str(items[item_name])
				child.get_node("ItemName").item_name = item_name
				break		
	print("picked up " + item_name + " in inventory: " + str(items[item_name]))
