extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Camera3D.current == true:
		$trunk_mesh.mesh.material.albedo_color = Color.RED
	else:
		$trunk_mesh.mesh.material.albedo_color = Color.WHITE

