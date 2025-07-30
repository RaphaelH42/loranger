extends Node3D

@onready var decipher = $Caesar_Decipher_1_3
@onready var innercircle = decipher.get_node("Empty_001")
@onready var outercircle = decipher.get_node("Empty")

@onready var mesh_innercircle = $innercircle
@onready var mesh_outercircle = $outercircle

signal puzzle_solved

var steps : int = 0
var angle_degrees = 360.0 / 26.0
var angle_radians = deg_to_rad(angle_degrees)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mesh_innercircle.visible = false
	mesh_outercircle.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
	
	
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
		
		var collider = result.collider
		
		if collider and collider.is_in_group("outer"):
			outercircle.rotate(Vector3.UP, angle_radians)
			steps += 1
			
		if collider.is_in_group("inner"):
			innercircle.rotate(Vector3.UP, -angle_radians)
			steps += 1
		
		is_puzzled_solved()
<<<<<<< HEAD
		
		if collider.is_in_group("back_to_main"):
			get_tree().change_scene_to_file("res://camera_script.tscn")
			
=======
>>>>>>> 59510b83e89232a772f99a6db29f48be8a26aba7
			
			
			
func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://camera_script.tscn")
		
func is_puzzled_solved():
	if steps == 14 or steps == 22:
		emit_signal("puzzle_solved")
