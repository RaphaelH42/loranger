extends Node3D

@onready var dialogue_balloon = $"../DialogueUi"
@onready var dialogue_resource = preload("res://dialogue/katze_test.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		dialogue_balloon.start(dialogue_resource, "katze_test")
