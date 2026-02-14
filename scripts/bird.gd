extends CharacterBody2D

@export var GM:Node
const SPEED = 300.0
const JUMP_VELOCITY = -1100.0

@onready var anim = $AnimationPlayer
@onready var srpite = $AnimatedSprite2D

@onready var flap_sound = $Flap

@export var is_alive:= true:
	set(val):
		if val == false and is_alive == true:
			anim.play("Death")
			srpite.pause()
			is_alive = val
			

func jump():
	velocity.y = JUMP_VELOCITY
	flap_sound.play()
	if anim.current_animation != "Jump":
		anim.play("Jump")
	

func _input(event):
	if (Input.is_action_just_pressed("Jump") or event is InputEventScreenTouch) and event.is_pressed() and is_alive:
		jump()
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_alive and velocity.y > 0 and anim.current_animation != "Fall":
		anim.play("Fall")
	move_and_slide()
