extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	# refresh player score
	var player_score = get_node("/root/Global").player_score
	$ProgressBar.value = 100 - player_score
	$ProgressBar2.value = player_score
	pass


func _on_Phone_pressed():
	get_tree().change_scene("res://scenes/Phone.tscn")
	pass


func _on_Computer_pressed():
	get_tree().change_scene("res://scenes/Computer.tscn")
	pass


func _on_Timer_timeout():
	if get_node("/root/Global").phone:
		$Phone.disabled = false
		$Computer.disabled = true
		$PhoneSound.play()
	else:
		$Phone.disabled = true
		$Computer.disabled = false
		$ComputerSound.play()
	pass
