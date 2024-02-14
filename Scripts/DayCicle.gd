extends Node
class_name DayCicleScript

#clock_logic
var clock_run : bool = false
var clock : Vector4 = Vector4(0,0,0,0)
var clock_time : String
var ten_minute_lenght : float = 0.2

var timer : float = 0.0

#day_sun_logic
var day_time : float
var day_lenght : float
var day_ratio : float
var start_time : float = 0.35

func _ready():
	day_lenght = 24 * 6 * ten_minute_lenght
	day_ratio = 1.0 / day_lenght
	day_time = start_time
	start_day()
	
func _process(delta):
	clock_logic()
	if clock.x == 18:
		end_day()
	clock_time = "%02d:%02d" % [clock.x, clock.y]

func clock_logic():
	if clock_run:
		clock.z += get_process_delta_time()
		if clock.z >= ten_minute_lenght:
			clock.y += 10
			clock.z = 0.0
		if clock.y >= 60:
			clock.x += 1
			clock.y = 00
		if clock.x == 24:
			clock.x = 0
		
		day_time += get_process_delta_time() * day_ratio
		
func end_day():
	clock_run = false
	timer += get_process_delta_time()
	if timer >= 5.0:
		timer = 0.0
		start_day()
		
func start_day():
	clock = Vector4(9, 0, 0, clock.w)
	clock.w += 1
	day_time = start_time
	clock_run = true
