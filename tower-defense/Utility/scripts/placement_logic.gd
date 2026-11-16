extends Node2D

const TILE_SIZE := Vector2(64, 64)
@onready var player: CharacterBody2D = $"../../../Player"
@onready var tower_sprite: Sprite2D = $"../TowerSprite"
@onready var placement_sprite: Sprite2D = $PlacementSprite
@onready var tower = $".."


var is_placed := false
var my_turn := false


func _ready() -> void:
	tower_sprite.visible = false
	placement_sprite.visible = true
	
	
func _process(delta: float) -> void:
	if is_placed == false:
		tower.global_position = player.global_position.snapped(TILE_SIZE)
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Interact"):
		placement_sprite.visible = false
		tower_sprite.visible = true
		tower.placed = true
		is_placed = true

func stack():
	pass
