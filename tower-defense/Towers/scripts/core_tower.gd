extends Area2D

var Health := 100
var HOVERING := false


func _process(delta: float) -> void:
	if Health <= 0:
		die()


func _input(event: InputEvent) -> void:
	if HOVERING == true:
		if Input.is_action_pressed("Click"):
			hurt()

func hurt():
	Health -= 10
	$Sprite2D/AnimationPlayer.play("hurt")

func die():
	pass


func _on_area_entered(area: Area2D) -> void:
		if area.is_in_group("Enemy"):
			hurt()
			area.queue_free()
