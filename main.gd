extends Node3D

var tree_scene = preload("res://tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	seed(42)
	for _i in range(10):
		var loc = {}
		loc["p"] = (Vector2(randf_range(-20, 20), randf_range(-20, 20)))
		loc["r"] = (randf_range(0, 2 * PI))
		var t = tree_scene.instantiate()
		add_child(t)
		loc["node"] = (t)
		t.position.x = loc["p"].x
		t.position.z = loc["p"].y
		t.rotation.y = loc["r"]
		print(loc)
		Global.tree_loc.append(loc)
