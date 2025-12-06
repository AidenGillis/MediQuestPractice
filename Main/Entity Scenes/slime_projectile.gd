extends CharacterBody2D

@export var speed = 100
@onready var anim = $AnimatedSprite2D

var dir: Vector2 = Vector2.ZERO
var spawnPos : Vector2
var spawnRot: float

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	
	velocity = dir * speed
	rotation = dir.angle()
	
	anim.play()
	
func _physics_process(_delta):
	move_and_slide()
