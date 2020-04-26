extends Area2D

signal pickup()


func _on_EndSword_body_entered(body):
	if body is Player:
		emit_signal("pickup")
