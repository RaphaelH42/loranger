extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_3d_3_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		get_tree().change_scene_to_file("res://furniture/wandschrank/wandschrank_schubladen.tscn")



func _on_area_3d_4_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		get_tree().change_scene_to_file("res://furniture/wandschrank/wandschrank_schubladen.tscn")
