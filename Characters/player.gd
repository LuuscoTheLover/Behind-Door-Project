extends CharacterBody3D

@onready var pivot = $CameraPivot


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var gravity = 9.8


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
