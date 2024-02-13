extends Node3D

@onready var sun : DirectionalLight3D = $Sun
@onready var moon : DirectionalLight3D = $Moon
@export var sun_intensity : Curve
@export var sun_color : Gradient

@export var moon_intensity : Curve
@export var moon_color : Gradient

@onready var environment = $WorldEnvironment as WorldEnvironment
@export var sky_top_color : Gradient
@export var sky_horizon_color : Gradient
@export var ground_color : Gradient

var time

func _ready():
	pass
	
func _process(delta):
	time = DayCicle.day_time
	sun.rotation_degrees.x = (time * 360 ) + 90
	sun.light_color = sun_color.sample(time)
	sun.light_energy = sun_intensity.sample(time)
	
	moon.rotation_degrees.x = (time * 360 ) + 270
	moon.light_color = moon_color.sample(time)
	moon.light_energy = moon_intensity.sample(time)
	
	sun.visible = sun.light_energy > 0
	moon.visible = moon.light_energy > 0
	
	environment.environment.sky.sky_material.set("sky_top_color", sky_top_color.sample(time))
	environment.environment.sky.sky_material.set("sky_horizon_color", sky_horizon_color.sample(time))
	environment.environment.sky.sky_material.set("ground_bottom_color", ground_color.sample(time))
	environment.environment.sky.sky_material.set("ground_horizon_color", sky_horizon_color.sample(time))
