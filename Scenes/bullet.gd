class_name Bullet
extends Area2D

@export var speed : float = 700
var direction : Vector2 ##agregar, direccion normalizada

#x=2, y = 2, w, 124 h, 124
#move the w and h
var bullet_dict = {
	"ORBSMALL" : Rect2( -2, 0, 132, 128),
	"ORBBIG" : Rect2( 127, 2, 130, 128),
	"ORBSTRETCH" : Rect2( 256, 2, 128, 128),
	"TALISMAN" : Rect2( -2, 129, 132, 128),
	"KUNAI" : Rect2( 127, 129, 130, 128),
	"SHARD" : Rect2( 255, 129, 130, 128),
	"PRISM" : Rect2( -2, 255, 130, 128),
	"DARKSTRETCH" : Rect2( 127, 255, 130, 128),
	"WIND" : Rect2( 255, 256, 130, 128),
	"BULLET" : Rect2( -2, 375, 132, 128),
	"PELLET" : Rect2( 127, 384, 130, 128),
}
#this could probably be implemented better, but alas

func _set_all(i : int):
	var spr : String
	match i:
		0: 
			spr = "ORBSMALL"
			_set_area_size(10,20)
			pass
		1: 
			spr = "ORBBIG"
			_set_area_size(20,40)
			pass
		2:
			spr = "ORBSTRETCH"
			_set_area_size(8,40)
			pass
		3:
			spr = "TALISMAN"
			_set_area_size(18,50)
			pass
		4:
			spr = "KUNAI"
			_set_area_size(8,30)
			pass
		5:
			spr = "SHARD"
			_set_area_size(5,40)
			pass
		6:
			spr = "PRISM"
			_set_area_size(6,40)
			pass
		7:
			spr = "DARKSTRETCH"
			_set_area_size(6,40)
			pass
		8:
			spr = "WIND"
			_set_area_size(10,30)
			pass
		9:
			spr = "BULLET"
			_set_area_size(8,40)
			pass
		10:
			spr = "PELLET"
			_set_area_size(5,10)
			pass
	_change_sprite(spr)
	
	#we have a number, we put the correct sprite and hitbox to that bullet
	pass

func _change_sprite(spr : String) -> void :
	$Sprite2D.region_rect = bullet_dict[spr]
	pass

func _set_area_size(rad : float, hei : float):
	$CollisionShape2D.shape.radius = rad
	$CollisionShape2D.shape.height = hei
	pass
	
func set_speed(spd : float):
	speed = spd
	pass

func set_direction(dir:Vector2):
	direction = dir
	pass

func _physics_process(delta: float) -> void:
	translate(direction*speed*delta)
	rotation = direction.angle()+deg_to_rad(90)
	#we keep the bullet looking like it should not sideways and moving
	pass

func _on_area_entered(area: Area2D) -> void:
	var player : Player = area.get_parent() as Player
	player._hit()
	##player.queue_free() ##cambiar por hacer daño
	queue_free()

	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
#remove the bullet when it leaves the screen, less clutter that way
