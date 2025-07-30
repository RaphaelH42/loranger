extends Node3D

@onready var animationplayer = $"../AnimationPlayer"
#@onready var dialogue_balloon = get_tree().get_root().get_node("/root/camera_script/DialogueUi")


#var dialogue_resource = preload("res://dialogue/zauberbuch.dialogue")


#@onready var dialogue_resource = preload("res://dialogue/zauberbuch.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	#if Input.is_action_just_pressed("LeftMouse"):
		#print("whatever")
		#animationplayer.play("open_book")
		#dialogue_balloon.start(dialogue_resource, "zauberbuch")
		
func _input(event):
		#Raycast, um Mausklick in Position in der 3D-Welt zu übersetzen
	if Input.is_action_just_pressed("LeftMouse"):
		#Kamera, die zum Raycasten genutzt werden soll, wird ausgewählt
		var camera = get_tree().get_nodes_in_group("Camera")[0] 
		#Mouse-Position wird gespeichert
		var mousePos = get_viewport().get_mouse_position()
		#Variable für Länge von Raycast
		var rayLength = 100
		#Ausgangspunkt für Raycast
		var from = camera.project_ray_origin(mousePos)
		#Von Ausgangspunkt Strahl bis zu diesem Punkt, um zu überprüfen, ob der auf etwas trifft
		var to = from + camera.project_ray_normal(mousePos) * rayLength
		#Festlegen, dass wir eine 3D-Welt haben
		var space = get_world_3d().direct_space_state
		#Erstellen eines Raycast-Strahles
		var rayQuery = PhysicsRayQueryParameters3D.new()
		#Festlegen des Startpunktes des Strahles
		rayQuery.from = from
		#Festlegen des Endpunktes des Strahles
		rayQuery.to = to
		#Variable für Überschneidungen des Strahles mit der Spielwelt
		var result = space.intersect_ray(rayQuery)
		
		if result:
			var collider = result.collider
			if collider.is_in_group("cover"):
				print("Book was clicked!")
				animationplayer.play("open_book")
				#dialogue_balloon.start(dialogue_resource, "zauberbuch")
<<<<<<< HEAD


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		get_tree().change_scene_to_file("res://furniture/buecherschrank_closeup.tscn")
=======
>>>>>>> 59510b83e89232a772f99a6db29f48be8a26aba7
