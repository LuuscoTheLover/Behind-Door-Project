extends Camera3D

@export var mouse_sense : float = 0.3
@onready var pivot = $".."

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		pivot.rotate_y(deg_to_rad(-event.relative.x * mouse_sense))
		rotate_x(deg_to_rad(-event.relative.y * mouse_sense))
		rotation_degrees.x = clamp(rotation_degrees.x, -60, 60)
	
	if event.is_action_pressed("esc"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("mouse_left"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
