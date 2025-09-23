extends Node2D
# Main.gd (or any script in the scene)
@export var cam: Camera2D
@export var room: ColorRect # your boundary rectangle

func _ready():
	# Convert the Control's rect to world coords
	var rect = room.get_global_rect()
	cam.limit_left   = int(rect.position.x)
	cam.limit_top    = int(rect.position.y)
	cam.limit_right  = int(rect.position.x + rect.size.x)
	cam.limit_bottom = int(rect.position.y + rect.size.y)
