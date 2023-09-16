extends Node

var checkpoint_pos = 0

func _ready():
	Global.fruits = 0
	if Global.is_dead:
		Global.player_health = 3

func _on_Trigger_player_entered_Camera():
	$BossCamera.current = true

func _on_Boss_BossDead():
	$BossCamera.current = false
	
	

