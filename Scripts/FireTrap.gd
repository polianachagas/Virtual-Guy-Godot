extends Area2D


func _ready():
	pass

func _on_fire_body_entered(body):
	if body.has_method("player_damage"):
		body.player_damage()

func _on_start_timer_timeout():
	$anim.play("on")
	$fire_col.set_deferred("disabled", false)
	
func _on_stop_timer_timeout():
	$anim.play("off")
	$fire_col.set_deferred("disabled", true)
