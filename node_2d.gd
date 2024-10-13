extends Node2D


var score : int 
var axis : Vector2


func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("derecha")) - int(Input.is_action_pressed("izquierda")) 
	axis.y = int(Input.is_action_pressed("JUMP_VELOCITY"))
	return axis.normalized()
