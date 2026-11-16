extends Area2D

var SPEED = randf_range(95, 125)
var velocity: Vector2
var Health := 3

func _process(delta: float) -> void:
	velocity = global_position.direction_to(Vector2(0, 0)) * SPEED
	global_position = global_position.move_toward(Vector2(0,0), SPEED * delta)

func die():
	queue_free()
