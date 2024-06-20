extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var timer = $Timer

var speed = 200
var health = 10000
var damage
var isattack = false
var attackanim = false
var dead = false
var player_in_area= false
var player
func _ready():
	dead = false
func _physics_process(delta):
	#if attackanim==true:
		#print("wow")
		
		
	if Input.is_action_pressed("attack"):
		
		print(health)
		damage=50

		take_damage(damage)
		
	if !dead:
		$detection_area/CollisionShape2D.disabled = false
		if player_in_area:
			position += (player.position- position) / speed
			$AnimatedSprite2D.play("move")
		else:
			$AnimatedSprite2D.play("idle")
	if dead:
		$detection_area/CollisionShape2D.disabled = true


func _on_detection_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#if body.has_method("player"):
	$AnimatedSprite2D.play("attack")
	player_in_area=true
	player=body


func _on_detection_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	isattack = false
	player_in_area=false
	

		


func _on_hitbox_body_entered(body):

	attackanim = true
	isattack = true
	

func take_damage (damage):
	health= health - damage
	if health <= 0 and ! dead:
		death()

func death():
	dead = true
	$AnimatedSprite2D.play("death")
	await get_tree().create_timer(1).timeout
	queue_free()
	get_tree().change_scene_to_file("res://scenes/END.tscn")


func _on_hitbox_body_exited(body):
	attackanim = false
	pass # Replace with function body.
