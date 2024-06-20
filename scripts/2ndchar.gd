extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var speed = 100
var current_dir = "none"
# Called when the node enters the scene tree for the first time.


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	if direction[0]>0:
		animated_sprite_2d.flip_h = false
	elif direction[0]<0:
		animated_sprite_2d.flip_h = true
	var input_dir = Vector2.ZERO
	if Input.is_action_pressed("attack"):
		animated_sprite_2d.play("attack")
	if Input.is_action_pressed("left"):
		animated_sprite_2d.play("side_walk")
		current_dir = "left"
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		animated_sprite_2d.play("side_walk")
		current_dir = "right"
		input_dir.x += 1
		
	if Input.is_action_pressed("up"):
		animated_sprite_2d.play("back_walk")
		current_dir = "up"
		input_dir.y -= 1
	if Input.is_action_pressed("down"):
		animated_sprite_2d.play("front_walk")
		current_dir = "down"
		input_dir.y += 1


	velocity = input_dir.normalized() * speed
	move_and_collide(velocity * delta)	
	#
	#
	#if direction[0]==0:
		#animated_sprite_2d.play("front_idle")
	#else:
		#animated_sprite_2d.play("attack")
	#velocity = direction * 50 
	#move_and_slide()


