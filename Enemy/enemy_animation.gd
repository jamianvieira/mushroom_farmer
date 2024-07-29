extends Node
@export var sprite : AnimatedSprite2D
@onready var enemy : Enemy = get_owner()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.play()
	if !enemy.velocity:
		sprite.animation = "idle"
		return
	
	#sprite.flip_h = enemy.velocity.x < 0
	if enemy.velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

	var animation_name = "walk"
	
	if enemy.velocity.length() > 30:
		animation_name = "run"

	sprite.animation = animation_name
