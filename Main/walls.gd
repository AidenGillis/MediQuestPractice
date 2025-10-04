extends StaticBody2D
@onready var WallBump = $AudioStreamPlayer2D
func _ready():
	if body_entered(CollisionShape2D):
		WallBump.play()
	
