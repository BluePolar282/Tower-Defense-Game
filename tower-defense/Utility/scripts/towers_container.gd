extends Node

var GunTower = preload("res://Towers/scenes/gun_tower.tscn")
var AoeTower = preload("res://Towers/scenes/aoe_tower.tscn")

signal resetTower
var selectedTowerType
var towerPlaced = false
var currentTower

func _ready() -> void:
	#resetTower.connect(_on_reset_tower)
	selectedTowerType = GunTower
	add_child(selectedTowerType.instantiate())

#func _on_reset_tower():
	#if selectedTowerType:
		#add_child(selectedTowerType.instantiate())

func _on_aoe_button_pressed() -> void:
	selectedTowerType = AoeTower
	add_child(selectedTowerType.instantiate())

func _on_gun_button_pressed() -> void:
	selectedTowerType = GunTower
	add_child(selectedTowerType.instantiate())
