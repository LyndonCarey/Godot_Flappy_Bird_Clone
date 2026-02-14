extends Area2D

@export var GM:Node


func _on_body_entered(body):
	GM.game_over = true
