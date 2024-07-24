extends Node
@export var sprite : AnimatedSprite2D
@export var movement: Node
@onready var player : Player = get_owner()
var idle=2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = movement.velocity

	sprite.play()
	
	if velocity.length() < movement.speed:
		match idle:
			0:
				sprite.animation = "idle_right"
			1:
				sprite.animation = "idle_left"
			2:
				sprite.animation = "idle_down"
			3:
				sprite.animation = "idle_up"

	if velocity.x > 0:
		sprite.animation = "walk_right"
		idle=0
	elif velocity.x < 0:
		sprite.animation = "walk_left"
		idle=1
	if velocity.y > 0:
		sprite.animation = "walk_down"
		idle=2
	elif velocity.y < 0:
		sprite.animation = "walk_up"
		idle=3

