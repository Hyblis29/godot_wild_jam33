extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var end = get_node("/root/Global").end()
	if end == null:
		$Label.text = get_node("/root/Global").get_phone_datas()
		$SendButton.show()
	else:
		$Label.text = end
		$SendButton.hide()
	pass


func _on_SendButton_pressed():
	# next, the player must see the computer
	get_node("/root/Global").phone = false
	
	get_tree().change_scene("res://scenes/Room.tscn")
	pass
