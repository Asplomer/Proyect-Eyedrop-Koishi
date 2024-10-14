extends Node2D

func _ready() -> void:
	$Control/ColorRect/AnimationPlayer.play("fade_in")
	$Control/ColorRect/AnimationPlayer.animation_set_next("fade_in", "RESET")
	# this is kinda buggy for a frame, but its the fade in. the transition to "reset" also looks buggy
	pass # Replace with function body.



func _on_character_body_2d_playerdead() -> void:
	$Enemy.queue_free()
	$Control/ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	
	get_tree().change_scene_to_file("res://Scenes/fishing_part.tscn")
	
	#welp the player died, we give a moment to sink in before changing scenes
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	$Enemy.emit_signal("DEADENEMY")
	$Control/ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/fishing_part.tscn")
	#ohooo, the player did it! we give it a moment to bask in glory 
	
	pass # Replace with function body.
