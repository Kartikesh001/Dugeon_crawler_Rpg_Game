extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var isattack = false
@onready var timer = $Timer

func _on_detection_area_body_entered(body):
	isattack = true
	animated_sprite_2d.play("attack")

	pass # Replace with function body.

func _process(delta):
	if (isattack==true):
		if Input.is_action_pressed("attack"):
			animated_sprite_2d.play("death")
			timer.start()
			

func _on_detection_area_body_exited(body):
	isattack = false
	animated_sprite_2d.play("idle")
	pass # Replace with function body.


func _on_timer_timeout():
	queue_free()

	pass # Replace with function body.
