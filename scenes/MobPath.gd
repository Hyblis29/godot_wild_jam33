extends Path2D


# Variables
export var speed = 50


# Signals
signal mob_touched


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PathFollow2D.set_offset($PathFollow2D.get_offset() + speed * delta)
	pass


func init(points):
	for point in points:
		curve.add_point(point)
	pass


func _on_Mob_body_entered(body):
	emit_signal("mob_touched")
	print("outch a mob!")
	pass
