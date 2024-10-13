extends CharacterBody2D

var speed = 300
var jump_speed = -500
var kick_strength = 1500

var gravity = 800
var original_rotation: float
var kick_rotation: float = -45.0
var kick_duration: float = 0.2
var Pelota: RigidBody2D

func _ready():
	original_rotation = $Zapato.rotation
	Pelota = get_parent().get_node("Pelota")  # Asegúrate de que la ruta sea correcta

func _input(event):
	if event.is_action_pressed("Patear"):
		kick()

func kick():
	$Zapato.rotation = original_rotation + kick_rotation
	await get_tree().create_timer(kick_duration).timeout
	$Zapato.rotation = original_rotation

func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("izquierda"):
		direction.x -= 1
	if Input.is_action_pressed("derecha"):
		direction.x += 1
		
	velocity.x = direction.x * speed
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
		
	velocity.y += gravity * delta
	
	move_and_slide()
	
	if Input.is_action_just_pressed("Patear"):
		_kick_ball()

func _kick_ball():
	if Pelota and Pelota.is_valid():  # Cambia is_instance_valid() a is_valid()
		var direction = (Pelota.global_position - global_position).normalized()
		Pelota.apply_impulse(Vector2.ZERO, direction * kick_strength)  # Corrige el uso de Vector2.ZERO
