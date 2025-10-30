class_name Slime
extends CharacterBody2D

@export var speed: float = 35
@onready var anim = $Slime_Animation
var start_position
var target: Player

func _ready():
	start_position = global_position
	target = %Player

func update_velocity():
	if(global_position.distance_to(%Player.global_position)<175):
		var direction = (%Player.global_position - global_position)
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2(0,0);
	if(global_position.distance_to(%Player.global_position)<175 and global_position.distance_to(%Player.global_position)>10):
		anim.play("Slime_bounce")
	else:
		anim.stop()

func _physics_process(_delta: float) -> void:
	update_velocity()
	move_and_slide()
	
