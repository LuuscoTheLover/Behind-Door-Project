extends Node3D

@onready var sun : DirectionalLight3D = $Sun
@onready var moon : DirectionalLight3D = $Moon

func _ready():
	pass
	
func _process(delta):
	sun.rotation_degrees.x = (DayCicle.day_time * 360 ) + 90
