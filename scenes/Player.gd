extends KinematicBody2D


# Variables
export var speed = 400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Player's movement
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
#		$Sprite.play()
#	else:
#		$Sprite.stop()
	
	# Clamping
	move_and_slide(velocity, Vector2(1, -1))
	position.x = clamp(position.x, 221, 913)
	position.y = clamp(position.y, 168, 568)
	
	# Flip animation sprite
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.flip_v = velocity.y > 0
	pass


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	pass
