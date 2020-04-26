extends KinematicBody2D
class_name Enemy

enum DIRECTION {
	LEFT,
	RIGHT
}

export(float) var attack_time = 1
export(DIRECTION) var direction = DIRECTION.LEFT

const dagger_class = preload("res://scene/game/enemy/dagger.tscn")


onready var throw_point = $ThrowPoint


var attack_timer = Timer.new()

func _ready():
	attack_timer.connect("timeout", self, "_on_attack_timer_timeout")
	attack_timer.wait_time = attack_time
	self.add_child(attack_timer)
	attack_timer.start()


func _on_attack_timer_timeout():
	$AnimationPlayer.play("attack")


func attack():
	var instance = dagger_class.instance()
	
	instance.position = throw_point.position
	if DIRECTION.LEFT == direction:
		instance.rotation_degrees = -90
		instance.direction = Vector2(-1, 0)
	else:
		instance.rotation_degrees = 90
		instance.direction = Vector2(1, 0)
	self.add_child(instance)
