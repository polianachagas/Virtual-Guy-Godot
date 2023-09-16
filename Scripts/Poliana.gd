extends KinematicBody2D

export (Resource) var interaction_princess

func _ready():
	$dialog_box_princess.add_message(interaction_princess.msg_queue)

