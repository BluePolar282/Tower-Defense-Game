extends Area2D

@onready var health_bar: ProgressBar = $HealthBar

var SPEED = randf_range(95, 125)
var velocity: Vector2
var health := 3
signal damaged

func _process(delta: float) -> void:
	velocity = global_position.direction_to(Vector2(0, 0)) * SPEED
	global_position = global_position.move_toward(Vector2(0,0), SPEED * delta)

func _on_damaged() -> void:
	health -= 1
	health_bar.value -= 1
	print("ouch")
	if health <= 0:
		die()

func die():
	queue_free()
