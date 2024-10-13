extends RigidBody2D

# Velocidad y dirección inicial
var speed = 250.0
var velocity = Vector2()  # Inicializamos la variable velocity
var kick_strength = 1500

func _ready():
	# Establecemos la dirección inicial de la pelota
	velocity = Vector2(-1, -1).normalized() * speed

func _physics_process(delta):
	# Mueve la pelota y maneja las colisiones
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

# Función que se llama para aplicar impulso
func kick(direction: Vector2):
	# Aplicar impulso en la dirección especificada y añadir un componente vertical
	var upward_force = Vector2(0, -300)  # Ajusta este valor para el impulso vertical
	apply_impulse(Vector2.ZERO, (direction * kick_strength) + upward_force)
