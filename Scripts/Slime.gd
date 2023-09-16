extends enemyBase

func _physics_process(delta):
	_set_animation()
	apply_gravity(delta)
	
