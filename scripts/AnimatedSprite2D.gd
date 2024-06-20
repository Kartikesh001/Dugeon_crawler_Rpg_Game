extends AnimatedSprite2D

@onready var animated_sprite_2d = $"."
var speed = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	if direction[0]>0:
		animated_sprite_2d.flip_h = false
	elif direction[0]<0:
		animated_sprite_2d.flip_h = true
	pass
