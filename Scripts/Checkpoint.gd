extends Area2D

func _ready():
	pass

func _on_Checkpoint_body_entered(body: Node):
	if body.name == "Player":
		body.hit_checkpoint()
		$anim.play("checked")
		$collision.queue_free()
