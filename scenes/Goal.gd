extends Area2D


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
