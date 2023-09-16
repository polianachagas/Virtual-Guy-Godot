extends Control

func _ready():
	$return_btn.grab_focus()

func _on_return_btn_pressed():
	get_tree().change_scene("res://Scenes/Start_screen.tscn")
