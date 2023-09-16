extends KinematicBody2D

export var speed = 52
export var health = 1
var motion = Vector2.ZERO
var gravity = 1200
var move_direction = -1  
var hitted = false

func _physics_process(delta: float) -> void:
	motion.x = speed * move_direction
	
	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
		
	_set_animation()
		
	motion = move_and_slide(motion)
	
func apply_gravity(delta):
	motion.y += gravity * delta
		
func _set_animation():
	var anim = "run"
	
	if $ray_wall.is_colliding():
		$ray_wall.scale.x *= -1
		move_direction *= -1
	elif motion.x != 0:
		anim = "run"
	
	if hitted == true:
		anim = "hit"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
		
func _on_Hitbox_body_entered(body: Node) -> void:
	hitted = true
	health -= 1
	body.velocity.y = body.jump_force / 2
	$hitFx.play()
	yield(get_tree().create_timer(0.2), "timeout")
	hitted = false
	if health < 1:
		queue_free()
		get_node("Hitbox/collision").set_deferred("disabled", true)

#func _process(delta):
	_set_animation()
	if $ray_wall.is_colliding():
		$ray_wall.scale.x *= -1
		move_direction *= -1
		$anim.play("run")
