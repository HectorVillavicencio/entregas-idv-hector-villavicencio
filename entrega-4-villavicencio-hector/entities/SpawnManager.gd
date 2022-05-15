extends Node


export (NodePath) var pathfinding: NodePath

export (bool) var instance_cosa:bool setget set_instance_cosa

func set_instance_cosa(value:bool):
	instance_cosa = false
	if value && Engine.editor_hint:
		pass

func _ready():
	if pathfinding.is_empty():
		return

	var pathfinder:PathfindAstar = get_node(pathfinding)
	if pathfinder == null:
		return
		
	for child in get_children():
		if child is KinematicBody2D:
			child.pathfinding = pathfinder
	
