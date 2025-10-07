class_name Player
extends CharacterBody2D

@export var speed: float =200
var currentHealth: int = 3
var HitsWall = false
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
	var hit_wall_this_frame = false
		
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision.get_collider() is StaticBody2D:
			hit_wall_this_frame = true
			
	if hit_wall_this_frame and not HitsWall:
				$"../../../Walls/WallBump".play()
	
	HitsWall = hit_wall_this_frame
	velocity = input_vector * speed
	move_and_slide()
			
		
