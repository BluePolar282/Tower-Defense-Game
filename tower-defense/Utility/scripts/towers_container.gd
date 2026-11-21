extends Node

var GunTower = preload("res://Towers/scenes/gun_tower.tscn")
var AoeTower = preload("res://Towers/scenes/aoe_tower.tscn")

signal resetTower
var selectedTower
var can_clear := false

func _ready() -> void:
	resetTower.connect(_reset_tower)

func _reset_tower():
	can_clear = false



func _on_aoe_button_pressed() -> void:
	if selectedTower and can_clear:
		selectedTower.queue_free()
		print("aoegone")
		
	selectedTower = AoeTower.instantiate()
	add_child(selectedTower)
	can_clear = true

func _on_gun_button_pressed() -> void:
	if selectedTower and can_clear:
		selectedTower.queue_free()
		print("gungone")
		
	selectedTower = GunTower.instantiate()
	add_child(selectedTower)
	can_clear = true
