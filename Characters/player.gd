extends CharacterBody3D

@onready var pivot = $CameraPivot
@onready var camera = $CameraPivot/Camera3D


const RUN_SPEED = 7
const WALK_SPEED = 4
const JUMP_VELOCITY = 4.5

var speed : int
var gravity = 9.8

#bob const
const BOB_FREQ : float = 2.0
const BOB_AMP : float = 0.08
var bob_time : float = 0.0

func _ready():
	pass

func _process(delta):
	%Hour.text = DayCicle.clock_time
	%Day.text = str(DayCicle.clock.w)

func _physics_process(delta):
	basic_movement(delta)





func basic_movement(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	speed = WALK_SPEED
	if Input.is_action_pressed("run"):
		speed = RUN_SPEED

	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	velocity.x = move_toward(velocity.x, 0, speed)
	velocity.z = move_toward(velocity.z, 0, speed)
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	bob_time += delta * velocity.length() * int(is_on_floor())
	camera.transform.origin = head_bob(bob_time)
	
	move_and_slide()
	
func head_bob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(bob_time * BOB_FREQ) * BOB_AMP
	pos.x = cos(bob_time * BOB_FREQ / 2) * BOB_AMP
	return pos
