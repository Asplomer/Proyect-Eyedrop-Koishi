extends Node2D



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/fishing_part.tscn")
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial_menu.tscn")
	pass # Replace with function body.
