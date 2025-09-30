extends CharacterBody2D

@export var speed := 150.0
@export var accel := 800.0
@export var arrive_radius := 64.0        # start slowing down within this many px
@export var enemy_radius := 8.0          # ≈ half-width of your enemy collider

@onready var target: Node2D = get_node_or_null("../Player") as Node2D
@onready var player_radius: float = 8.0  # set to your player's collider half-width

func _physics_process(delta: float) -> void:
	if target == null or !is_instance_valid(target):
		return

	var to_target := target.global_position - global_position
	var dist := to_target.length()
	var contact_dist := enemy_radius + player_radius   # where sprites should "touch"

	if dist <= contact_dist:
		# hard stop when we’re touching
		velocity = velocity.move_toward(Vector2.ZERO, accel * delta)
	else:
		# ARRIVE: scale desired speed by distance so we don't overshoot
		var desired_speed := speed
		if dist < arrive_radius:
			desired_speed = speed * (dist - contact_dist) / max(1.0, arrive_radius - contact_dist)
			desired_speed = clamp(desired_speed, 0.0, speed)

		var desired := to_target.normalized() * desired_speed
		velocity = velocity.move_toward(desired, accel * delta)

	# optional facing
	# rotation = lerp_angle(rotation, to_target.angle(), 0.1)

	# zero tiny jitter
	if velocity.length() < 1.0 and dist <= contact_dist + 1.0:
		velocity = Vector2.ZERO

	move_and_slide()
