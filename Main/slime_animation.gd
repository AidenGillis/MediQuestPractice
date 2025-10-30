extends AnimatedSprite2D

@onready var Squelch = $"../SlimeSquelch"

func _ready():
	connect("frame_changed", on_frame_changed)
func on_frame_changed():
	if frame == 1:
		Squelch.play()
