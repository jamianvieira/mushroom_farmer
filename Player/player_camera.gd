extends Camera2D

@export var target_path : NodePath
@export var speed := 10
var target

func _ready():
	if target_path:
		target = get_node(target_path)

func _physics_process(delta):
	position = lerp(position, target.position, speed * delta)
