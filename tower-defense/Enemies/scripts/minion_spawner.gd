extends Marker2D

var minion1_scene = preload("res://Enemies/scenes/minion_1.tscn")
 
@onready var spawn_timer: Timer = $SpawnTimer
@onready var wave_spawn_timer: Timer = $WaveSpawnTimer
@onready var wave_break_timer: Timer = $WaveBreakTimer


@onready var spawn_chance := 0
@export var spawn_radius := 128.0
var wave_spawning := false
var can_clear := false

func _process(delta: float) -> void:
	print(Globals.enemy_count)
	on_wave_cleared()
	spawn_wave()

func _on_timer_timeout() -> void: #Spawns individual enemies
	if wave_spawning:
		spawn_enemy()
		spawn_timer.wait_time = randf_range(0.7, 1)

func spawn_enemy():
	var minion1 = minion1_scene.instantiate()
	var angle = randf_range(0.0, TAU)
	var distance = randf_range(0.0, spawn_radius)
	var offset = Vector2(cos(angle), sin(angle)) * distance
	
	minion1.global_position = self.global_position + offset
	get_tree().current_scene.add_child(minion1)
	can_clear = true

func spawn_wave(): #Spawns enemies for a certain amount of time
	if wave_spawn_timer.time_left > 0:
		wave_spawning = true
	else:
		wave_spawning = false

func on_wave_cleared():
	if Globals.enemy_count <= 0 and can_clear:
		print("wave Cleared")
		wave_break_timer.start()
		Globals.enemy_count = 0
		can_clear = false
	
func _on_wave_break_timer_timeout() -> void:
	print("ready")
	wave_spawn_timer.start()
