extends Marker2D

var minion1 = preload("res://Enemies/scenes/minion_1.tscn")
@onready var timer: Timer = $Timer

@onready var spawn_chance := 0

func _on_timer_timeout() -> void:
	spawn_chance = randf_range(1, 10)
	if spawn_chance > 3:
		add_child(minion1.instantiate())
		
	timer.wait_time = randf_range(0.7, 1)
