extends Node3D

@onready var threshold = cos(deg_to_rad(Global.CAM_FOV) / 2)
var frame_count = 0

func _physics_process(_delta: float) -> void:
	frame_count += 1
	if frame_count % 5 == 0:
		var closest_cam
		var dist_to_cam = 999999.99
		for treecam in Global.tree_loc:
			var dir_vec = Vector2(global_position.x - treecam["p"].x, global_position.z - treecam["p"].y)
			var dir_norm = dir_vec.normalized()
			var dot = dir_norm.x * treecam["rv"].x + dir_norm.y * treecam["rv"].y
			# var thresh = cos(deg_to_rad(Global.CAM_FOV) / 2)
			# print(dot >= threshold)
			# print(treecam["node"].name + " dist: " + str(dist) + "dist to cam" + str(dist_to_cam))
			if dot >= threshold:
				var dist = dir_vec.length_squared()
				print(dir_vec.length())
				if dist < dist_to_cam:
					closest_cam = treecam
					dist_to_cam = dist
		if closest_cam:
			closest_cam["node"].get_node("Camera3D").make_current()
			print("Current Cam: " + closest_cam["node"].name)
