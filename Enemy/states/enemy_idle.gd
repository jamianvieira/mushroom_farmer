extends EnemyState
class_name EnemyIdle

var idle_timer : Timer

# Upon moving to this state, initialize the 
# timer with a random duration.
func enter():
	enemy.velocity = Vector2.ZERO
	
	idle_timer = Timer.new()
	idle_timer.wait_time = randi_range(3, 10)
	idle_timer.timeout.connect(on_timeout)
	idle_timer.autostart = true
	add_child(idle_timer)

func on_timeout():
	transitioned.emit(self, "wander")

func exit():
	idle_timer.stop()
	idle_timer.timeout.disconnect(on_timeout)
	idle_timer.queue_free()
	idle_timer = null
