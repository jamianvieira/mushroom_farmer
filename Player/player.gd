class_name Player
extends CharacterBody2D

signal hit

func _ready():
	pass
	
func _process(delta):
	pass

func _on_body_entered(body):
	#hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func item_pick_up(item_name: String):
	print("picked up " + item_name)


