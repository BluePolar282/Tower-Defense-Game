extends Node2D

var bullet = preload("res://Player/scenes/bullet.tscn")
@onready var muzzle: Marker2D = $Marker2D
@onready var cooldown_timer: Timer = $CooldownTimer

var cooldown := false

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click") and cooldown == false:
		shoot()

func shoot():
	cooldown = true
	
	var spawned_bullet = bullet.instantiate()
	
	get_tree().root.add_child(spawned_bullet)
	spawned_bullet.global_position = global_position
	spawned_bullet.rotation = rotation
	
	cooldown_timer.start()
	
func _on_cooldown_timer_timeout() -> void:
	cooldown = false
