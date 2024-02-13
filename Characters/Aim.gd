extends RayCast3D

@onready var player = $"../../.."

func _ready():
	add_exception(player)
