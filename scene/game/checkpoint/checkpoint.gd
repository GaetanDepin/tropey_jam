extends Area2D

signal checkpoint_activated(pos)


func _ready():
	$GreenParticule.hide()
	$RedParticule.show()
	$Light2D.color = Color(1, 0.6941, 0.2156, 1)
	$Light2D2.color = Color(1, 0.6941, 0.2156, 1)


func _on_Checkpoint_body_entered(body):
	if body is Player:
		emit_signal("checkpoint_activated", self.position)
		$RedParticule.hide()
		$GreenParticule.show()
		$Light2D.color = Color(0.5803, 1, 0.2666, 1)
		$Light2D2.color = Color(0.5803, 1, 0.2666, 1)
