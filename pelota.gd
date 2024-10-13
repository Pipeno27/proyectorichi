extends RigidBody2D

# Velocidad y dirección inicial
var speed = 250.0
var kick_strength = 300

func _ready():
	# Establecemos una dirección inicial aleatoria
	var initial_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	linear_velocity = initial_direction * speed

func _physics_process(delta):
	# Aquí puedes ajustar la física si es necesario
	if linear_velocity.length() > 0:
		linear_velocity = linear_velocity.normalized() * speed

# Función que se llama para aplicar impulso
func kick(direction: Vector2):
	# Aplicar impulso en la dirección especificada
	apply_impulse(Vector2.ZERO, direction * kick_strength)

# Método que maneja las colisiones con jugadores
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Jugadores"):  # Asegúrate de que tus jugadores estén en este grupo
		var direction = (global_position - body.global_position).normalized()
		kick(direction)  # Llama a la función kick cuando un jugador golpea la pelota
