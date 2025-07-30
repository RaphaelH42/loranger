extends Node3D

@export var player: Node3D  # Drag your Player node here in the Inspector

@onready var spring_arm: SpringArm3D = $SpringArm3D

# Offset of the camera rig relative to the player
@export var offset := Vector3(0, 3, 0)

# Zoom configuration
@export var zoom_speed := 0.50
@export var min_zoom := 3.0
@export var max_zoom := 20.0

func _process(delta):
	# Move this camera rig to follow the player's position plus an offset
	if player:
		global_position = player.global_position + offset

func _unhandled_input(event):
	# Mouse wheel zoom control
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			spring_arm.spring_length = max(min_zoom, spring_arm.spring_length - zoom_speed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			spring_arm.spring_length = min(max_zoom, spring_arm.spring_length + zoom_speed)
