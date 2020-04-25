extends Node2D


onready var player = self.get_node("Player")
onready var map = self.get_node("Map")

var last_checkpoint = Vector2.ZERO

func _ready():
	last_checkpoint = map.get_node("Spawn").position

func _on_map_checkpoint_activated(pos):
	last_checkpoint = pos


func _on_Player_player_die():
	player.position = last_checkpoint
