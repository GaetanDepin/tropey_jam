extends Node2D

signal checkpoint_activated(pos)

func _ready():
	connect_checkpoints()


func connect_checkpoints():
	for child in $CheckpointContainer.get_children():
		child.connect("checkpoint_activated", self, "_on_checkpoint_activated")


func _on_checkpoint_activated(pos):
	emit_signal("checkpoint_activated", pos)
