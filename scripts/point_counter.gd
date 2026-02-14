extends Area2D

@export var GM:Node

@onready var point_sound = $"../Point"


func _on_body_entered(body):
	GM.score += 1
	point_sound.play()
	queue_free()
