extends KinematicBody2D

var facing_left = true
var hitted = false
var health = 3

export var speed = 52
var motion = Vector2.ZERO
var gravity = 1200
var move_direction = -1  

onready var player = Global.get("player")

func _physics_process(delta):
	motion.x = speed * move_direction
#	motion = move_and_slide(motion)
	
	_set_animation()
	
	if player:
		var distance = player.global_position.x - self.position.x 
		facing_left = true if distance < 0 else false
		
	if move_direction == 1:
			$texture.flip_h = true
	else:
			$texture.flip_h = false
		
func _set_animation():
	var anim = "idle"
	
	if $ray_wall.is_colliding():
		anim = "idle"
	if motion.x != 0 and health == 2:
		anim = "run"
		speed = 100
	elif motion.x != 0 and health == 1: 
		anim = "run"
		speed = 200
	
	if $ray_wall.is_colliding():
		$ray_wall.scale.x *= -1
		move_direction *= -1
	elif motion.x != 0:
		anim = "idle"
	
	if $player_detector.overlaps_body(player):
		anim = "run"
		motion = move_and_slide(motion)
	else:
		anim = "idle"
		
	if hitted == true:
		anim = "hit"
		
	if $anim.assigned_animation != anim:
		$anim.play(anim)

func _on_player_detector_body_entered(body):
	$anim.play("run")
	
func _on_player_detector_body_exited(body):
	$anim.play("idle")
	
		
func _on_Hitbox_body_entered(body):
	hitted = true
	health -= 1
	body.velocity.y = body.jump_force / 2
	$hitFx.play()
	yield(get_tree().create_timer(0.2), "timeout")
	hitted = false
	if health < 1:
		queue_free()
		get_node("Hitbox/collision").set_deferred("disabled", true) 
