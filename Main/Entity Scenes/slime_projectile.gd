extends CharacterBody2D

@export var Speed = 100
@onready var anim = $AnimatedSprite2D

var dir : float
var spawnPos : Vector2
var spawnRot: float

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	anim.play()
	
func _physics_process(_delta):
	velocity = Vector2(0,-Speed).rotated(dir)
	move_and_slide()
