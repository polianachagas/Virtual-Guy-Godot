extends Control

func _ready():
	$controls/start_btn.grab_focus()
	Global.player_health = 3
	Global.player_life = 3
	Global.checkpoint_pos = null

func _on_start_btn_pressed():
	get_tree().change_scene("res://Levels/Level_01.tscn")

func _on_controls_btn_pressed():
	var controlScreen = load("res://Scenes/Controls_screen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen)

func _on_quit_btn_pressed():
	get_tree().quit()
