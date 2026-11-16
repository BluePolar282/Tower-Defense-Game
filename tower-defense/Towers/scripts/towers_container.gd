extends Node2D

var GunTower = load("res://Towers/scenes/gun_tower.tscn")

var resetTower := false

func _process(delta: float) -> void:
	var GunTowerReady = GunTower.instantiate()
	if resetTower == true:
		add_child(GunTowerReady)
		resetTower = false
