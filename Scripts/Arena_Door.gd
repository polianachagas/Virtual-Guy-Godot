extends StaticBody2D

signal DoorClosed

func _ready():
	pass

func _on_Trigger_player_entered():
	$anim.play("active")
	yield(get_tree().create_timer(0.2), "timeout")
	emit_signal("DoorClosed")

func _on_Boss_BossDead():
	$anim.play("inactive")
