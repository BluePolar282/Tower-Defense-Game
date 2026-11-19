extends Node

var GunTower = load("res://Towers/scenes/gun_tower.tscn")
var AoeTower = load("res://Towers/scenes/aoe_tower.tscn")

var resetTower := false

func _process(delta: float) -> void:
	var GunTowerReady = GunTower.instantiate()
	var AoeTowerReady = AoeTower.instantiate()
	
	if resetTower == true:
		add_child(AoeTowerReady)
		resetTower = false
