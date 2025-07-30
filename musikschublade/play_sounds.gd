extends Node3D
#Importieren aller sounds durch audioplayer aus "Audiostreamer"-Szene
@onready var audioplayer = $audiostreamer
@onready var audio_1 = audioplayer.get_node("AudioStreamPlayer")
@onready var audio_2 = audioplayer.get_node("AudioStreamPlayer2")
@onready var audio_3 = audioplayer.get_node("AudioStreamPlayer3")
@onready var audio_4 = audioplayer.get_node("AudioStreamPlayer4")
@onready var audio_wrong = audioplayer.get_node("AudioStreamPlayer5")
@onready var audio_applause = audioplayer.get_node("AudioStreamPlayer6")
#Importieren von Timer, um Audios später nacheinander abspielen zu lassen
@onready var timer = $Timer
@onready var animationplayer : AnimationPlayer = $AnimationPlayer

#Lösung der Reihenfolge, in der die Sounds abgespielt werden sollen
@onready var solution : Array[int] = [1, 2, 3, 4]
#Array zum Sammeln der Sounds, die der*die Spieler*in ausprobiert
@onready var attempt : Array[int] = [0, 0, 0, 0] 
@onready var attempt_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_play_area_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		#Abspielen der Soundreihenfolge, die nachgespielt werden muss. Timer und await, damit
		# die Sounds nacheinander und nicht gleichzeitig abgespielt werden
		audio_1.play()
		timer.start(audio_1.stream.get_length())
		await timer.timeout
		audio_2.play()
		timer.start(audio_2.stream.get_length())
		await timer.timeout
		audio_3.play()
		timer.start(audio_3.stream.get_length())
		await timer.timeout
		audio_4.play()


func _on_audio_1_area_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		#Audio 1 spielen, zum Attempt-Array hinzufügen und mit Lösung vergleichen
		audio_1.play()
		compare(1)


func _on_audio_2_area_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		#Audio 2 spielen, zum Attempt-Array hinzufügen und mit Lösung vergleichen
		audio_2.play()
		compare(2)


func _on_audio_3_area_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		#Audio 3 spielen, zum Attempt-Array hinzufügen und mit Lösung vergleichen
		audio_3.play()
		compare(3)

func _on_audio_4_area_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftMouse"):
		#Audio 4 spielen, zum Attempt-Array hinzufügen und mit Lösung vergleichen
		audio_4.play()
		compare(4)
		
func compare(number : int):
	#Eingabe des*der Spieler*in in Attempt-Array einfügen
	attempt.set(attempt_index, number)
	#Überprüfen, ob Eingabe mit Lösung übereinstimmt
	if attempt[attempt_index] == solution[attempt_index]:
		attempt_index += 1
	#Wenn Eingabe inkorrekt, dann wrong-Sound und Zurücksetzen des Attempt-Arrays
	else:
		timer.start(1)
		await timer.timeout
		audio_wrong.play()
		attempt = [0, 0, 0, 0]
		attempt_index = 0
	# Wenn letzter Sound richtig erkannt, Applaus-Sound und nach 5 Sekunden, Weiterleiten zu
	# Szene mit Notizbuch in Schublade
	if attempt[3] == 4:
		timer.start(1)
		await timer.timeout
<<<<<<< HEAD
		#animationplayer.play("schublade_auf")
=======
		animationplayer.play("schublade_auf")
>>>>>>> 59510b83e89232a772f99a6db29f48be8a26aba7
		timer.start(1.2)
		await timer.timeout
		get_tree().change_scene_to_file("res://schublade_mit_notizbuch/schublade_mit_notizbuch.tscn")

	
