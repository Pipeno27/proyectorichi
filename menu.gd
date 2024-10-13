extends Node2D

var sonidoMenu = preload("res://sonidos/ytmp3free.cc_samba-de-amigo-samba-de-janeiro-youtubemp3free.org.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	BocinaPrincipal.stream = sonidoMenu
	#BocinaPrincipal.play()
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://cancha_de_futbol.tscn")
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://instrucciones.tscn")
	pass # Replace with function body.
