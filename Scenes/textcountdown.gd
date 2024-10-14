extends TextureProgressBar
@export var spellcard_duration = 15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = spellcard_duration
	$Timer.start()
	max_value = spellcard_duration
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = $Timer.time_left 
	##    
	pass
