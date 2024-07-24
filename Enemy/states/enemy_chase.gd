extends EnemyState
class_name EnemyFollow

@export var move_speed := 100

func enter():
	player = get_tree().get_first_node_in_group("Player")

func physics_process_state(delta):
	var direction = player.global_position - enemy.global_position
	print(direction.length())
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		
	if direction.length() > 200:
		transitioned.emit(self, "wander")
