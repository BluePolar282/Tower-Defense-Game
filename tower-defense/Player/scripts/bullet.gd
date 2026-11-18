extends Node2D

var SPEED = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.damaged.emit()
		self.queue_free()


func _on_despawn_timer_timeout() -> void:
	queue_free()
