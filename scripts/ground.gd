extends StaticBody2D
@export var GM:Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.LEFT*GM.scroll_speed*delta
	if position.x <= -1344:
		position.x = 0
