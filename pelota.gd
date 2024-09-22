extends RigidBody2D

# Variables de configuración
var fuerza_pateo = 500 # Fuerza adicional cuando se le da una patada

func _ready():
	# Inicializa la velocidad de la pelota a cero
	linear_velocity = Vector2.ZERO

func _on_Pelota_body_entered(body):
	if body.is_in_group("jugador"):
		# Aplica una fuerza adicional cuando la pelota colisiona con el jugador
		var direccion = (position - body.position).normalized()
		apply_impulse(Vector2.ZERO, direccion * fuerza_pateo)
