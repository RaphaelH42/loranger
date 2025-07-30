extends Control

@onready var videoplayer : VideoStreamPlayer = $AspectRatioContainer/VideoStreamPlayer
@onready var timer : Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	videoplayer.play()
	timer.start(53)
	await timer.timeout
	get_tree().change_scene_to_file("res://camera_script.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
