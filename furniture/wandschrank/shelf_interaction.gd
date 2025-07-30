extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		get_tree().change_scene_to_file("res://musikschublade/main.tscn")
		

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://camera_script.tscn")

		
<<<<<<< HEAD


func _on_area_3d_paper_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		get_tree().change_scene_to_file("res://schubladen/schublade_paper.tscn")


func _on_area_3d_clock_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		get_tree().change_scene_to_file("res://schubladen/schublade_clock.tscn")
=======
>>>>>>> 59510b83e89232a772f99a6db29f48be8a26aba7
