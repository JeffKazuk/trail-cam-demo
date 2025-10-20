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

	global_position += direction.rotated(Vector3(0,1,0),rotation.y)

func _process(_delta):
	for treecam in Global.tree_loc:
		var dir_vec = Vector2(position.x - treecam["p"].x,position.z - treecam["p"].y).normalized()
		var dot = dir_vec.x * treecam["rv"].x + dir_vec.y * treecam["rv"].y
		print(dot)