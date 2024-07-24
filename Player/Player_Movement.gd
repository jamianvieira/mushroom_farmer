extends Node
@export var speed = 150 # How fast the player will move (pixels/sec).
@onready var player : Player = get_owner()
var velocity=Vector2(0,0)
var screen_size # Size of the game window.
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = player.get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	player.position += velocity * delta
	player.position = player.position.clamp(Vector2.ZERO, screen_size)
	self.velocity = velocity
