extends Node2D

@export var GM:Node
@onready var kill_area = $"Kill Area"
@onready var point_area = $"Point Counter"

var currently_visble: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	kill_area.GM = GM
	point_area.GM = GM


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.LEFT*GM.scroll_speed*delta


func _on_visibility_changed():
	print("changed")


func _on_despawn_timer_timeout():
	if GM.game_over == false:
		queue_free()
