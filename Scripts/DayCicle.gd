extends Node
class_name DayCicleScript

var clock_run : bool = false
var clock : Vector4 = Vector4(0,0,0,0)
var clock_time : String
var timer : float = 0.0
var day_time : float

func _ready():
	start_day()
	
func _process(delta):
	if clock_run:
		clock.z += delta
	
		if clock.z >= 0.2:
			clock.y += 10
			clock.z = 0.0
		
		if clock.y >= 60:
			clock.x += 1
			clock.y = 00

		if clock.x == 24:
			clock.x = 0
		
	if clock.x == 3:
		end_day()
		
	day_time = clock.x / 24
	clock_time = "%02d:%02d" % [clock.x, clock.y]

func end_day():
	clock_run = false
	timer += get_process_delta_time()
	print(timer)
	if timer >= 5.0:
		timer = 0.0
		start_day()
		

func start_day():
	clock = Vector4(9, 0, 0, clock.w)
	clock.w += 1
	clock_run = true
