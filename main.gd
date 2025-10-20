extends Node3D

var tree_scene = preload("res://tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	seed(42)
	for _i in range(10):
		var loc = []
		loc.append(Vector2(randf_range(-20, 20), randf_range(-20, 20)))
		loc.append(randf_range(0, 2 * PI))
		var t = tree_scene.instantiate()
		add_child(t)
		loc.append(t)
		t.position.x = loc[0].x
		t.position.z = loc[0].y
		t.rotation.y = loc[1]
		print(loc)
		Global.tree_loc.append(loc)
