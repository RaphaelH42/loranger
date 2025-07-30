extends Control

@onready var videoplayer : VideoStreamPlayer = $AspectRatioContainer/VideoStreamPlayer


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://intro_okay.tscn")
	
	
	


func _on_options_pressed() -> void:
	print("options")


func _on_exit_pressed() -> void:
	get_tree().quit()


	
