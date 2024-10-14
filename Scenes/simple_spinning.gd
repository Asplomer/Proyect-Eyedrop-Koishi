extends Node2D
@export var degrees_per_second = 253.0
func _physics_process(delta: float) -> void:
	
	rotate(delta * deg_to_rad(degrees_per_second))
	#spin me right around, baby right around
	#value changes because we might need different velocities for different shooter
	pass
