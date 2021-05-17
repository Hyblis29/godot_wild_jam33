extends Area2D


# Variables
var choices = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func init(pos, cho):
	position = pos
	choices = cho
	pass
