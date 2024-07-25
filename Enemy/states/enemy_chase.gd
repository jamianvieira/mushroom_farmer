extends EnemyState
class_name EnemyFollow

@export var chase_speed := 100

func physics_process_state(delta):
	var direction = player.global_position - enemy.global_position
	var distance = direction.length()
	if distance > enemy.chase_radius:
		transitioned.emit(self, "wander")
		return
	
	enemy.velocity = direction.normalized()*chase_speed
		
	if distance <= enemy.follow_radius:
		enemy.velocity = Vector2.ZERO
	
	enemy.move_and_slide()
		
