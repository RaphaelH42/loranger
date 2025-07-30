extends Node3D


@onready var dialogue_balloon = $"../DialogueUi"
@onready var dialogue_resource = preload("res://dialogue/zauberbuch.dialogue")

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		dialogue_balloon.start(dialogue_resource, "zauberbuch")
