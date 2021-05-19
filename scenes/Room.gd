extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_score = get_node("/root/Global").player_score
	$ProgressBar.value = 100 - player_score
	$ProgressBar2.value = player_score
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Phone_pressed():
	get_tree().change_scene("res://scenes/Phone.tscn")
	pass


func _on_Computer_pressed():
	get_tree().change_scene("res://scenes/Computer.tscn")
	pass
