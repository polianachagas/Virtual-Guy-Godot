extends Area2D


func _ready():
	pass


func _on_Trampoline_body_entered(body):
	body.velocity.y = body.jump_force / 1.2
	$anim.play("jump")
