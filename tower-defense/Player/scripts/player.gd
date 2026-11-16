extends CharacterBody2D

#Testing Github

var Bullet = preload("res://Player/scenes/bullet.tscn")

const SPEED = 200
@onready var CURRENT_DIR = "front"


func _physics_process(delta):
	get_input()
	move_and_slide()
	
#MOVEMENT/ANIMATIONS
func get_input():
	var DIRECTION = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = DIRECTION * SPEED
	if velocity.x:
		$Sprite2D.flip_h = velocity.x < 0
	

	
