extends Node2D

@export var BulletProfile : int
@export var bulletScene : PackedScene

@export var shoots: int = 1
@export var bspeed : float = 300

@export var bulletnum =0
@export var firerate : float = 0.06 
var can_shoot :bool = false
 
#this many exports are for apliying the data i need to the bullets, what sprite it should have, speed and whatnot
#also the can_shoot is for stoping the enemy to shooit at the start


func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	can_shoot= true
	
	# here we can see that after a small timer we can shoot again, allowing a pause between entering the secene and fighting 
	pass

func _on_timer_timeout() -> void:
	if can_shoot:
		var rot = 360/shoots
		$AudioStreamPlayer2D.play()
		for i in range(shoots):

			_shoot(rot*i)
			$Timer.wait_time = firerate
	pass # Replace with function body.
	#so, if we can indeed shot, we shoot and rotate based on the number of shoots.
	# the timer part is because i dont want to shoot every frame
	
	
func _shoot( fangle : float) :
	
	var b : Bullet = bulletScene.instantiate()
	b._set_all(bulletnum)
	b.set_speed(bspeed)
	get_tree().root.add_child(b)
	b.position = $Marker2D.global_position
	$".".rotation_degrees=fangle
	b.set_direction(global_position.direction_to($Marker2D.global_position))
	#pretty standard stuff, instantiate the bullet, give it all parameters we need it to have and off it goes
	pass
