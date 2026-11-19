extends Area2D

@onready var cooldown_timer: Timer = $CooldownTimer
@onready var parent: Node = $".."

var placed = false
var enemy : Area2D
var cooldown := false
signal in_range

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemy = area
		if cooldown_timer.time_left <= 0:
			cooldown_timer.start()
			
func _on_cooldown_timer_timeout() -> void:
	cooldown = false
	in_range.emit()

func _on_in_range() -> void:
	if enemy != null and cooldown == false:
		enemy.damaged.emit()
		cooldown = true
		if cooldown_timer.time_left <= 0:
			cooldown_timer.start()
	
	
	
func _on_placement_logic_tower_placed() -> void:
	$DetectionArea.monitoring = true
	$CollisionShape2D.disabled = false
	parent.resetTower = true
