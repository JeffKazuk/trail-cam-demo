extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = .2
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO


func _physics_process(_delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_right"):
		rotation.y += .05
	if Input.is_action_pressed("ui_left"):
		rotation.y -= .05
	if Input.is_action_pressed("ui_down"):
		direction.z += speed
	if Input.is_action_pressed("ui_up"):
		direction.z -= speed

	global_position += direction.rotated(Vector3(0, 1, 0), rotation.y)

