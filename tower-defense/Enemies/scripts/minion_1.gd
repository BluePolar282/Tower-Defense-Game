extends Area2D

@onready var health_bar: ProgressBar = $HealthBar

var SPEED = randf_range(95, 125)
var velocity: Vector2
var health :float= 3.0
var is_in_aoe_range := false
signal damaged

func _ready() -> void:
	Globals.enemy_count += 1

func _process(delta: float) -> void:
	velocity = global_position.direction_to(Vector2(0, 0)) * SPEED
	global_position = global_position.move_toward(Vector2(0,0), SPEED * delta)

func _on_damaged() -> void:
	health -= 1
	health_bar.value -= 1
	if health <= 0:
		die()

func die():
	Globals.money += 5
	Globals.enemy_count -= 1
	queue_free()
