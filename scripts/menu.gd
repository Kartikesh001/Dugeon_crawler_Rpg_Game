extends Control




func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	

func _on_option_pressed():
	get_tree().change_scene_to_file("res://scenes/optons.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
