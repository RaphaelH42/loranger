extends CharacterBody3D

@onready var navigationAgent : NavigationAgent3D = $NavigationAgent3D
@onready var videoplayer: VideoStreamPlayer = $"../AspectRatioContainer/VideoStreamPlayer"
@onready var timer = $"../Timer"
@onready var emile = $Node3D/emile_Walking_inplace
@onready var animationplayer_emile = emile.get_node("AnimationPlayer")

@export var inv : Inv

@export var inv : Inv

#Variablen um Timer zu starten und Puzzle zu starten
var timer_has_started = false
var puzzle_started = false
#Geschwindigkeit mit der der Player sich vorwärts bewegt
var Speed = 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Textfelder werden am Anfang gehidet


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Wenn Player sein Ziel erreicht hat, wird hier die Funktion verlassen	
	if (navigationAgent.is_navigation_finished()):
		return
	
	movetoPoint(delta, Speed)
	pass
	
func movetoPoint(delta, speed):
	#Variable der nächsten Position, die der Player einnimmt
	var targetPos = navigationAgent.get_next_path_position()
	#Variable der Position 
	var direction = global_position.direction_to(targetPos)
	#Player dreht sich in die Richtung, in der er läuft
	faceDirection(targetPos)
	#Geschwindigkeit für move_and_slide()
	velocity = direction * speed
	#Befehl der Fortbewegung
	move_and_slide()
	#emiles Bewegungsanimation wird abgespielt
	animationplayer_emile.play("mixamo_com")
	#for-Loop für jede Collision
	for i in get_slide_collision_count():
		#Variable mit allen Informationen über Collision an Stelle i
		var collision = get_slide_collision(i)
		#Variable für Objekt, die in Collision involviert war
		var collider = collision.get_collider()
		#Prüfen, ob Objekt der Gruppe "walls" angehört (in diesem Fall Objekt 'Wall')
		if collider and collider.is_in_group("walls"):

			#Dieser if-Befehl ist wahrscheinlich unnötig, weil doppelt gemoppelt
			if collider and collider.is_in_group("walls"):
				#Es wird überprüft, ob Taste "E" gedrückt wurde
				if Input.is_action_just_pressed("interact"):
					videoplayer.play()
						
			
		#Überorüfen ob Collisionobjekt in Gruppe "puzzlewalls", in diesem Fall "Wall2"
		if collider and collider.is_in_group("puzzlewalls"):
			#Sichtbarmachen von Order 2
			#Überprüfen, ob Eingabeaufforderung schon ausgegeben, damit das 
			# nicht in jedem Fall wieder ausgeführt wird

			if Input.is_action_just_pressed("raetseln") and not timer_has_started:
				timer.start(10)
				#Hiermit wird verhindert, dass Timer und Eingabeaufforderung wieder 
				# neu ausgegeben wird
				timer_has_started = true
				puzzle_started = true

					
	
func faceDirection(direction):
	# Sorgt dafür, dass der Player immer in die Richtung schaut, in die der Player geht
	look_at(Vector3(direction.x, global_position.y, direction.z), Vector3.UP)
	

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
		#Übergabe der Position der Überschneidung an NavigationAgent
		navigationAgent.target_location = result.position
		
func collect(item):
	inv.insert(item)
		
func player():
	pass
