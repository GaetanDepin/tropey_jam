extends Area2D

signal checkpoint_activated(pos)



func _on_Checkpoint_body_entered(body):
	if body is Player:
		emit_signal("checkpoint_activated", self.position)
		self.modulate = Color(0, 1, 0, 1)
