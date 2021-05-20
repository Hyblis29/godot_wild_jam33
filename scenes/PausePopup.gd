extends Popup


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		show()
	pass


func _on_Unpause_pressed():
	hide()
	get_tree().paused = false
	pass


func _on_ReturnMainMenu_pressed():
	get_tree().paused = false
	
	# level initialization
	get_node("/root/Global").init()
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass
