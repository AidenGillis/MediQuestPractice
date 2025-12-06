class_name Slime
extends CharacterBody2D

@export var speed: float = 35
@onready var anim = $Slime_Animation
#@onready var main = get_tree().get_root().get_node("main")
@onready var projectile = load("res://Main/Entity Scenes/Slime_Projectile.tscn")
var start_position
var target: Player

func _ready():
	start_position = global_position
	target = %Player
	anim.connect("frame_reached", _on_slime_frame_reached)
	
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
	
func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	get_tree().current_scene.call_deferred("add_child", instance)
	
func _on_slime_frame_reached(frame: int):
	if frame == 21:
		shoot()
