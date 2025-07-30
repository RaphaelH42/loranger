extends Node3D

@onready var player_in_area = false

@onready var dialogue_balloon = $"../../DialogueUi"
@onready var dialogue_resource = preload("res://dialogue/start.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		print("interact")
		get_tree().change_scene_to_file("res://rotation_day/main.tscn")




func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		print("welcome")
		player_in_area = true
		dialogue_balloon.start(dialogue_resource, "explore")

		



func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		print("bye")
		player_in_area = false
