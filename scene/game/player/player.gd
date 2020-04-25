extends KinematicBody2D
class_name Player

signal player_die()


export(int) var SPEED = 450
export(int) var JUMP_HEIGHT = 1100
export(int) var GRAVITY = 38

var vel = Vector2.ZERO

func _process(delta):
	pass


func _physics_process(delta):
	update_velocity()
	vel = move_and_slide(vel, Vector2.UP)


func update_velocity():
	vel.x = 0
	if Input.is_action_pressed("movement_left"):
		vel.x -= 1
	if Input.is_action_pressed("movement_right"):
		vel.x += 1
	if Input.is_action_pressed("movement_jump") and is_on_floor():
		vel.y -= JUMP_HEIGHT
	vel.x *= SPEED
	vel.y += GRAVITY
