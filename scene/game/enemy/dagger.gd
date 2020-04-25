extends Area2D

export(int) var speed = 500
export(Vector2) var direction = Vector2.ZERO

func _process(delta):
	self.position.x += speed * delta * direction.x
	self.position.y += speed * delta * direction.y
