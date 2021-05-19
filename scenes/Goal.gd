extends Area2D


# Variables


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func init(pos, choices):
	position = pos
	for item in choices:
		$OptionButton.add_item(item["word"], item["score"])
	pass


func _on_Goal_body_entered(body):
	$OptionButton.disabled = false
	pass


func _on_Goal_body_exited(body):
	$OptionButton.disabled = true
	pass
