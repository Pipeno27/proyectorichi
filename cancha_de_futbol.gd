extends StaticBody2D

var sonidoFondo = preload("res://sonidos/ytmp3free.cc_samba-do-brasil-ey-macalena-youtubemp3free.org.mp3")
var Menu = preload("res://sonidos/ytmp3free.cc_samba-de-amigo-samba-de-janeiro-youtubemp3free.org.mp3")



# Called when the node enters the scene tree for the first time.
func _ready():
	changeSound(sonidoFondo)
	pass # Replace with function body.



func _readyy():
	var nueva_escena = load("res://cancha_de_futbol.gd").instance()
	add_child(nueva_escena)
	
	changeSound(Menu)
func changeSound(new_sound):
	BocinaPrincipal.stream = new_sound
	BocinaPrincipal.play()

func _on_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu.tscn")
	pass # Replace with function body.
