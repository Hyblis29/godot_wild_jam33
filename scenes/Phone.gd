extends Control


# Variables
var end


# Called when the node enters the scene tree for the first time.
func _ready():
	end = get_node("/root/Global").end()
	if end == null:
		$RichTextLabel.text = get_node("/root/Global").get_phone_datas()
	else:
		$RichTextLabel.text = end
	pass


func _on_SendButton_pressed():
	if end == null:
		# next, the player must see the computer
		get_node("/root/Global").phone = false
		get_tree().change_scene("res://scenes/Room.tscn")
	else:
		get_node("/root/Global").init()
		get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass
