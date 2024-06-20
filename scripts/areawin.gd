extends Area2D

var count = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if count==0:
		get_tree().change_scene_to_file("res://scenes/END.tscn")




func _on_body_entered(body):
	#print("heloodofd")
	if body is RigidBody2D:
		print(count)
		count = count - 1
		#print("The object is a RigidBody2D")
	#if body.has_node("RigidBody2D"):
		#print("hello")
		#pass # Replace with function body.
	


func _on_body_exited(body):
	if body is RigidBody2D:
		
		count = count + 1
	pass # Replace with function body.
