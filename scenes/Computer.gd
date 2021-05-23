extends Node2D


export (PackedScene) var MobPath
export (PackedScene) var Obstacle
export (PackedScene) var Goal


# Variables
var level_datas
var off


# Called when the node enters the scene tree for the first time.
func _ready():
	off = true
	$BackgroundOn.hide()
	$BackgroundOff.show()
	$Player.hide()
	
	level_datas = get_node("/root/Global").get_computer_datas()
	pass


func start():
	# Player initialization
	$Player.start(level_datas["player_pos"])
	$Player.show()
	
	# Instruction initialisation
	$Instruction.text = level_datas["instruction"]
	
	# Mobs initialization
	for mob_datas in level_datas["mobs"]:
		var mob = MobPath.instance()
		mob.add_to_group("mobs")
		mob.init(mob_datas)
		mob.connect("mob_touched", self, "_on_mob_touched")
		add_child(mob)
		
	# Obstacles initialization
	for obs_datas in level_datas["obstacles"]:
		var obstacle = Obstacle.instance()
		obstacle.add_to_group("obstacles")
		obstacle.init(obs_datas["pos"], obs_datas["scale"])
		add_child(obstacle)
		
	# Goals initialization
	for goa_datas in level_datas["goals"]:
		var goal = Goal.instance()
		goal.add_to_group("goals")
		goal.init(goa_datas["pos"], goa_datas["choices"], goa_datas["key"])
		add_child(goal)
	pass


func _on_Shutdown_pressed():
	# first time the button is pressed
	if off:
		off = false
		$BackgroundOn.show()
		$BackgroundOff.hide()
		$ComputerSound.play()
		start()
	# second time the button is pressed
	else :
		# increment level
		get_node("/root/Global").level += 1
		
		# add level score to global score
		for goal in get_tree().get_nodes_in_group("goals"):
			var point = goal.get_node("OptionButton").get_selected_id()
			get_node("/root/Global").player_score += point
		print(get_node("/root/Global").player_score)
		
		# next, the player must see the phone
		get_node("/root/Global").phone = true
		
		get_tree().change_scene("res://scenes/Room.tscn")
	pass


func _on_mob_touched():
	# vanishing animation of player
	var tween = get_node("Tween")
	var start_color = Color(1.0, 0.0, 0.0, 1.0)
	var end_color = Color(1.0, 0.0, 0.0, 0.0)
	tween.interpolate_property($Player, "modulate", start_color, end_color, 1.0,  9, 0)  # 9:trans_bounce, 0:ease_in
	tween.start()
	$Player.get_node("AudioStreamPlayer").play()
	pass


func _on_Tween_tween_completed(object, key):
	# remove Player when death animation end
	if object == $Player:
		$Player.queue_free()
	pass
