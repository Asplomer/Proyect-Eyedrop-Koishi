extends Area2D

signal DEADENEMY


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass



func _on_deadenemy() -> void:
	$AnimationPlayer.play("dead")
	#simply the enemy dies
	pass 
