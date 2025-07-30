extends StaticBody3D
@onready var player : CharacterBody3D = $"../CharacterBody3D"

@export var item : InvItem



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == player:
		print("player")
		playercollect()
		await get_tree().create_timer(0.1).timeout
		self.queue_free()
	
func playercollect():
	player.collect(item) 
