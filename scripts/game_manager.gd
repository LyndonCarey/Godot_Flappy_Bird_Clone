extends Node

@onready var foreground = %Foreground
@onready var pipes = %Pipes

@onready var score_label = $"../UI/Score"

@onready var screen_ui = $"../UI/Message"

@onready var spawn_timer = $"Spawn Timer"
@onready var death_timer = $"Death Timer"

var Bird_Scene = preload("uid://chm6nqk7egfpt")

@onready var bird = Bird_Scene.instantiate()

var Pipe_Scene = preload("uid://cthjs4u2fq3x0")

@export var scroll_speed: float = 400
@export var score: int = 0:
	set(val):
		if val > score: 
			score = val
			score_label.text = str(val)
			
@export var game_started = false:
	set(val):
		if val == true and game_over == false:
			game_started = true
			spawn_timer.start()
			screen_ui.hide()
		
var game_over = false:
	set(val):
		if val == true and game_over == false:
			game_over = true
			bird.is_alive = false
			scroll_speed = 0
			death_timer.start()
	
func _ready():
	bird.GM = self
	bird.position = Vector2(-200,0)
	foreground.add_child(bird)

func _on_spawn_timer_timeout():
	if game_over == false:
		var pipe = Pipe_Scene.instantiate()
		pipe.GM = self
		pipe.position = Vector2(700,randi_range(-600,250))
		pipes.add_child(pipe)


func _on_death_timer_timeout():
	get_tree().reload_current_scene()
