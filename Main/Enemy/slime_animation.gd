extends AnimatedSprite2D

@onready var Squelch = $"../SlimeSquelch"
signal frame_reached(frame: int)

func _ready():
	connect("frame_changed", on_frame_changed)
	
func on_frame_changed():
	emit_signal("frame_reached", frame)
	if frame == 1:
		Squelch.play()
	
