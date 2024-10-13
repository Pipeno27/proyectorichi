extends RigidBody2D

# Fuerza de rebote
var bounce_strength = 1500  # Ajusta este valor según sea necesario

# Función que se llama al inicio
func _ready():
	# No es necesario conectar la señal aquí si lo hiciste desde el Inspector
	pass

# Función para manejar el rebote
func kick(direction: Vector2):
	apply_impulse(Vector2.ZERO, direction * bounce_strength)

# Método generado al conectar la señal
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Jugadores"):  # Asegúrate de que tus jugadores estén en este grupo
		var direction = (global_position - body.global_position).normalized()
		kick(direction)  # Llama a la función kick cuando un jugador golpea la pelota
