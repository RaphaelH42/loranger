extends NavigationRegion3D
@onready var mesh_instance = $MeshInstance3D
@onready var texture = load("res://textures/rotator_table_UV.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var material := StandardMaterial3D.new()
	material.albedo_texture = texture
	mesh_instance.set_surface_override_material(0, material)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
