extends Node3D

@onready var threshold = cos(deg_to_rad(Global.CAM_FOV) / 2)

func _process(_delta):
	var closest_cam
	var dist_to_cam = 999999.99
	for treecam in Global.tree_loc:
		var dir_vec = Vector2(global_position.x - treecam["p"].x, global_position.z - treecam["p"].y)
		var dir_norm = dir_vec.normalized()
		var dot = dir_norm.x * treecam["rv"].x + dir_norm.y * treecam["rv"].y
		# var thresh = cos(deg_to_rad(Global.CAM_FOV) / 2)
		# print(dot >= threshold)
		if dot >= threshold:
			# print(dir_vec.length())
			if dir_vec.length_squared() < dist_to_cam:
				closest_cam = treecam
	if closest_cam:
		closest_cam["node"].get_node("Camera3D").make_current()