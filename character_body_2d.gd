print("En suelo: ", is_on_floor())

# Variables de configuración
var salto_velocidad = -600 # Velocidad inicial del salto (negativa para ir arriba)
var gravedad = 1000 # Fuerza de la gravedad
var velocidad = 200 # Velocidad de movimiento lateral
var rotacion_maxima = 70 # Ángulo máximo en grados
var angulo_actual = 0 # Para controlar la rotación del zapato
var fuerza_patada = 500 # Ajusta según sea necesario

# Referencias a los nodos de los sprites
@onready var cabeza = $Cabeza
@onready var zapato = $Zapato

func _ready():
	# Configura el personaje al inicio
	# No es necesario inicializar en_suelo aquí, se puede hacer en _process
	pass

func _process(delta):
	# Control del movimiento del personaje
	var direccion = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1
	
	direccion = direccion.normalized() * velocidad

	# Usa move_and_slide con el vector de velocidad
	move_and_slide(direccion)

	# Verifica si el personaje está en el suelo
	if is_on_floor():
		velocity.y = 0 # Reinicia la velocidad vertical si está en el suelo

	# Aplicar la gravedad si no está en el suelo
	if not is_on_floor():
		velocity.y += gravedad * delta

	# Actualiza la rotación del zapato
	if angulo_actual != 0:
		zapato.rotation_degrees = angulo_actual

func _input(event):
	if event.is_action_pressed("patear"):
		patear()

	if event.is_action_pressed("jump") and is_on_floor():
		saltar()

func patear():
	if angulo_actual == 0:
		# Inicializar la rotación si está en reposo
		angulo_actual = rotacion_maxima
	else:
		# Reducir gradualmente la rotación para simular una patada
		angulo_actual -= 10
		if angulo_actual < 0:
			angulo_actual = 0

	# Simula la aplicación de fuerza al zapato
	var direccion_patada = Vector2(1, 0).rotated(zapato.rotation)
	var impulso = direccion_patada * fuerza_patada
	zapato.position += impulso * get_process_delta_time()

func saltar():
	# Aplica la fuerza del salto
	velocity.y = salto_velocidad
