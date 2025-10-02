class_name Enemy1 
extends CharacterBody2D

@export var speed: float = 100

var start_position
var target: Player

func _ready():
	start_position

func update_velocity():
	if !target: return
	
	var direction = (target.global_position - global_position).normalized()
	var new_velocity = direction.normalized() * speed
	
	
func _physics_process(_delta: float) -> void:
	update_velocity()
	move_and_slide()

func _on_follow_area_body_entered(body):
	if body is Player:
		target = body
