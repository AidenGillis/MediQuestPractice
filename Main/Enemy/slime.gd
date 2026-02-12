class_name Slime
extends CharacterBody2D

@export var speed: float = 35
@onready var anim = $Slime_Animation
@onready var projectile = load("res://Main/Enemy/Slime_Projectile.tscn")
@onready var player = get_tree().get_first_node_in_group("player")
var start_position: Vector2
var target: Player

func _ready():
	start_position = global_position
	target = player
	anim.connect("frame_reached", _on_slime_frame_reached)
	
func update_velocity():
	if(global_position.distance_to(player.global_position)<250):
		var direction = (player.global_position - global_position)
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2(0,0);
	if(global_position.distance_to(player.global_position)<250 and global_position.distance_to(player.global_position)>10):
		anim.play("Slime_bounce")
	
	else:
		anim.stop()
	

func _physics_process(_delta: float) -> void:
	update_velocity()
	move_and_slide()
	
func shoot():
	if target == null:
		return
	
	var instance = projectile.instantiate()
	
	var to_player: Vector2 = target.global_position - global_position
	var dir: Vector2 = to_player.normalized()
	
	instance.dir = dir
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	instance.damage = 1
	
	get_tree().current_scene.call_deferred("add_child", instance)
	
func _on_slime_frame_reached(frame: int):
	if frame == 0:
		shoot()
