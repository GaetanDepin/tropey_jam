extends Area2D

export(int) var speed = 500
export(Vector2) var direction = Vector2.ZERO

func _process(delta):
	self.position.x += speed * delta * direction.x
	self.position.y += speed * delta * direction.y


func _on_Dagger_body_entered(body):
	if body is Player:
		body.player_die()
	if body.is_in_group("break_dagger"):
		self.queue_free()
