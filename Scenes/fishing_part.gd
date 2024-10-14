extends Node2D

@export var joystick = 0
@export var score = 0
# Called when the node enters the scene tree for the first time.
var progress : float = 30 
#the starting value of the progress bar, if i use it raw, it loses precision greatly

var prompts = {
	"up":{"spritenum":1, "inputE": "move_up"},
	"down":{"spritenum":3, "inputE": "move_down"},
	"left":{"spritenum":2, "inputE": "move_left"},
	"right":{"spritenum":4, "inputE": "move_right"},
}
#this are more for remembering which sprite to use

func _ready() -> void:
	randomize()
	$Control/LineEdit.text= str(score)
	#to be updated when i modify the score to be global
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	progress-= delta*3
	$Control/TextureProgressBar.value= progress
	#updating that progress bar
	pass
func _process(delta: float) -> void:

	#this is not working unless i click on close button??
	
	if Input.is_action_pressed("move_up") and joystick ==1 or Input.is_action_pressed("move_down") and joystick ==3 or Input.is_action_pressed("move_left") and joystick ==2 or Input.is_action_pressed("move_right") and joystick ==4 :
		_joystick_success()
	
	pass


func _on_timer_timeout() -> void:
	$Control/TimerPromt.start()
	_randomizejoy()
	# this aplies the next function every second
	pass

func _randomizejoy():
	var rng = RandomNumberGenerator.new()
	_update_joystick(_get_new_prompt())
	#this is the time to next flick of the sprite and whatnot
	pass

func _get_new_prompt():
	randomize()
	var random_prompt = randi_range(1,4)
	return random_prompt

func _to_hell():
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
	#when called waits a little before throwing the player into the action
	pass
	
func _joystick_success():
	_update_joystick(0)
	progress +=15
	#what happens when we pick the correct joystick promt, we return to neutral and increase the score, number to be tuned 
	pass


func _update_joystick(joy):
	joystick = joy
	$Control/Sprite2D.frame = joystick
	#could have done with an animation but i wanted to have better sprites, posibly something to update for better feel
	pass


func _on_texture_progress_bar_value_changed(value: float) -> void:
	if $Control/TextureProgressBar.value >= $Control/TextureProgressBar.max_value:
		_to_hell()
	
	#when the progress bar is filled, go to bullet hell
	pass # Replace with function body.
