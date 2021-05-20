extends MarginContainer


func _on_CreditButton_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")
	pass


func _on_QuitGameButton_pressed():
	get_tree().quit()
	pass


func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/Room.tscn")
	pass
