extends Area2D

# Esto se puede usar para gestionar las colisiones del área
func _on_body_entered(body: Node):
	if body.name == "PersonajeJP" or body.name == "Mauri":
		# Lógica para manejar la entrada del jugador
		get_parent().is_being_dragged = true
		get_parent().player = body

func _on_body_exited(body: Node):
	if body.name == "PersonajeJP" or body.name == "Mauri":
		# Lógica para manejar la salida del jugador
		get_parent().is_being_dragged = false
		get_parent().player = null
