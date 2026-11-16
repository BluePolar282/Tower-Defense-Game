extends Node2D

var bullet = preload("res://Player/scenes/bullet.tscn")
@onready var enemy :Node2D= null
@onready var turret: Sprite2D = $TowerSprite/turret

var placed := false
var tower_number : int

func _ready() -> void:
	print(tower_number)

func _process(delta: float) -> void:
	if tower_number == 1:
		$PlacementLogic.my_turn = true
	if placed:
		track_enemy()

func _on_cooldown_timer_timeout() -> void:
	if placed:
		shoot()
	else:
		return

func track_enemy():
	var enemies = get_tree().get_nodes_in_group("Enemy") #returns an array
	
	var closest_distance = INF #assumes closest enemy is INF(infinitely) far away to start with
	
	enemy = null
	for guy in enemies: #accesses enemies array
		var distance = global_position.distance_to(guy.global_position) #access distance to each enemy
		
		if distance < closest_distance: #if the guy is closer than the last guy
			closest_distance = distance #make him the new guy used for reference
			enemy = guy #officialize him as the node
		
	if enemy != null: 
		var prediction_time = 0.5
		var predicted_position = enemy.global_position + enemy.velocity * prediction_time

		turret.look_at(predicted_position)

func shoot():
	var spawned_bullet = bullet.instantiate()
	
	get_tree().root.add_child(spawned_bullet)
	spawned_bullet.global_position = global_position
	spawned_bullet.rotation = turret.rotation
