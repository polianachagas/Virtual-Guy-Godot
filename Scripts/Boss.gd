extends enemyBase

signal BossDead

func _ready():
	set_physics_process(false)
	
func _physics_process(delta):
	apply_gravity(delta)
	_set_boss_animation()
	
func _set_boss_animation():
	var anim = "bossRun"
	
	if $ray_wall.is_colliding():
		anim = "idle"
	elif motion.x != 0 and health > 5:
		anim = "bossRun"
	elif motion.x != 0 and health < 5: 
		anim = "angryRun"
		speed = 300
	
	if hitted == true:
		anim = "hit"
	
	if health < 1:
		anim = "die"
		emit_signal("BossDead")
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
	
func _on_Arena_Door_DoorClosed():
	set_physics_process(true)
