extends Area2D

class_name player_detector

export (NodePath) onready var enemy = get_node(enemy) as KinematicBody2D


func _on_player_detector_body_entered(body):
	enemy.player_ref = body

func _on_player_detector_body_exited(body):
	enemy.player_ref = null
