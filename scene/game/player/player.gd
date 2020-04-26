extends KinematicBody2D
class_name Player

signal player_die()


export(int) var SPEED = 450
export(int) var JUMP_HEIGHT = 1100
export(int) var GRAVITY = 38
export(bool) var movement_block: bool = false

onready var animation_player = self.get_node("AnimationPlayer")

var vel = Vector2.ZERO
var looking_left = false

func _process(delta):
	if !movement_block:
		set_animation()


func _physics_process(delta):
	if !movement_block:
		update_velocity()
		vel = move_and_slide(vel, Vector2.UP)


func update_velocity():
	vel.x = 0
	if Input.is_action_pressed("movement_left"):
		looking_left = true
		vel.x -= 1
	if Input.is_action_pressed("movement_right"):
		looking_left = false
		vel.x += 1
	if Input.is_action_pressed("movement_jump") and is_on_floor():
		vel.y -= JUMP_HEIGHT
	vel.x *= SPEED
	vel.y += GRAVITY


func set_animation():
	if vel.x == 0:
		if looking_left:
			animation_player.play("idle_left")
		else:
			animation_player.play("idle_right")
	else:
		if looking_left:
			animation_player.play("walk_left")
		else:
			animation_player.play("walk_right")


func player_die():
	emit_signal("player_die")
