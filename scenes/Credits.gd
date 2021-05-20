extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass # Replace with function body.
