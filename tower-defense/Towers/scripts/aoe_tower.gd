extends Area2D

@onready var cooldown_timer: Timer = $CooldownTimer
@onready var parent: Node = $".."

var placed = false
var enemies : Array[Area2D]


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemies.append(area)
			
func _on_cooldown_timer_timeout() -> void:
	if enemies != null:
		for enemy in enemies:
			if enemy != null:
				enemy.damaged.emit()

	
func _on_placement_logic_tower_placed() -> void:
	$DetectionArea.monitoring = true
	$CollisionShape2D.disabled = false
	parent.resetTower = true
