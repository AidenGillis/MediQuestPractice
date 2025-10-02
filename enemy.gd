class_name Enemy1 
extends CharacterBody2D

@export var speed: float = 25

var start_position
var target: Player

func _ready():
	start_position
	target = %Player

func update_velocity():
	if(global_position.distance_to(target.global_position)<100):
		var direction = (target.global_position - global_position)
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2(0,0);
	
func _physics_process(_delta: float) -> void:
	update_velocity()
	move_and_slide()
	

#func _on_follow_area_body_entered(body):
	#print(body);
	#if body is Player:
		#target = body
