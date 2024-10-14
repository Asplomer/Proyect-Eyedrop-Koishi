class_name Player
extends CharacterBody2D

signal PLAYERDEAD

@export var speed = 300.0
@export var focused_speed = 150.0

#i need to know my speed and also when focused


func _process(delta):
	var movement : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if 	!$AnimationPlayer.is_playing():
		if Input.is_action_pressed("focused"):
			velocity = movement.normalized() * focused_speed
			$Sprite2D/Sprite2D2.show()
		else:
			velocity = movement.normalized() * speed
			$Sprite2D/Sprite2D2.hide()
		move_and_slide()
	#with the 4 buttons we are able to move at 2 different speeds
	pass

func _hit():

	$AnimationPlayer.play("die")
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1.0).timeout
		##connect to main scene
	emit_signal("PLAYERDEAD") 
	queue_free()
	
	#its game over man, game over! after a little wait and emiting that we died so that the scene knows to transition
	pass
