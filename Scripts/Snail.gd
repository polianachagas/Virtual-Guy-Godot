extends enemyBase

func _physics_process(delta):
	_set_snail_animation()
	apply_gravity(delta)
	
func _set_snail_animation():
	var anim = "snail_run"
	
	if $ray_wall.is_colliding():
		anim = "idle"
	if motion.x != 0 and health == 2:
		anim = "snail_run"
	elif motion.x != 0 and health == 1: 
		anim = "fast_run"
		speed = 250
	
	if hitted == true:
		anim = "hit"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)

	
