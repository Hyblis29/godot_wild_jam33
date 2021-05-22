extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func init(pos, sca):
	position = pos
#	scale = sca
	$Sprite.region_rect = Rect2(0, 0, 64 * sca.x, 64 * sca.y)
	$CollisionShape2D.scale = sca
	pass
