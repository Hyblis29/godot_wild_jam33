extends Control


# Variables
var datas = [
	"level 0 blablablablablablbalbablbbal",
	"level 1 blablablablablablbalbablbbal",
	"level 2 blablablablablablbalbablbbal",
	"level 3 blablablablablablbalbablbbal",
	"level 4 blablablablablablbalbablbbal"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = datas[get_node("/root/Global").level]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SendButton_pressed():
	get_tree().change_scene("res://scenes/Room.tscn")
	pass # Replace with function body.
