extends KinematicBody2D

export (Resource) var interaction_espeto

func _ready():
	$dialog_box_espeto.add_message(interaction_espeto.msg_queue)
	
