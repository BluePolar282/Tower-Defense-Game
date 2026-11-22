extends Node2D

const TILE_SIZE := Vector2(64, 64)
@onready var player: CharacterBody2D = $"../../../Player"
@onready var tower_sprite: Sprite2D = $"../TowerSprite"
@onready var placement_sprite: Sprite2D = $PlacementSprite
@onready var tower = $".."
@onready var range_sprite: Polygon2D = $"../DetectionArea/RangeSprite"


var is_placed := false
var obstructed := false
var on_platform := false
signal tower_placed 

func _ready() -> void:
	tower_sprite.visible = false
	placement_sprite.visible = true
	
func _process(delta: float) -> void:
	if is_placed == false:
		tower.global_position = player.global_position.snapped(TILE_SIZE)
	if placement_sprite.visible == true: 
		if obstructed or not on_platform:
			$PlacementSprite.modulate = Color.DARK_RED
		else:
			$PlacementSprite.modulate = Color(0.341, 0.341, 0.341, 0.525)
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Interact") and on_platform and not obstructed:
		tower_sprite.visible = true
		placement_sprite.visible = false
		tower.placed = true
		is_placed = true
		tower_placed.emit()

#Make sure tile is free

func _on_placement_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Tower"):
		obstructed = true
		
	if area.is_in_group("PlacementPlatform"):
		on_platform = true
	

func _on_placement_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("Tower"):
		obstructed = false
	if area.is_in_group("PlacementPlatform"):
		on_platform = false
