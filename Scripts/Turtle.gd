extends enemyBase

func _physics_process(delta):
	_set_turtle_animation()
	apply_gravity(delta)
	
func _set_turtle_animation():
	var anim = "idle"
	
	if $ray_wall.is_colliding():
		anim = "idle"
	if motion.x != 0 and health == 2:
		anim = "idle"
		$hitbox_spike/spike_col.set_deferred("disabled", true)
		$Hitbox/collision.set_deferred("disabled", false)
	elif motion.x != 0 and health == 1: 
		anim = "idle_spike"
		speed = 150
		$hitbox_spike/spike_col.set_deferred("disabled", false)
		$Hitbox/collision.set_deferred("disabled", true)
	
	if hitted == true:
		anim = "hit"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)

func _on_hitbox_body_entered(body):
	hitted = true
	health -= 1
	body.velocity.y = body.jump_force / 2
	$hitFx.play()
	yield(get_tree().create_timer(0.2), "timeout")
	hitted = false
	if health < 1:
		queue_free()
		get_node("Hitbox/collision").set_deferred("disabled", true)


