extends Node2D


export (PackedScene) var MobPath
export (PackedScene) var Obstacle
export (PackedScene) var Goal


# Variables
var level_datas


# Called when the node enters the scene tree for the first time.
func _ready():
	var level = get_node("/root/Global").level
	level_datas = get_node("/root/Global").datas[level]
	start(level)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func start(level):
	# Player initialization
	$Player.start(level_datas["player_pos"])
	
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
		goal.init(goa_datas["pos"], goa_datas["choices"])
		add_child(goal)
	pass


func _on_Shutdown_pressed():
	# increment level
	get_node("/root/Global").level += 1
	# add level score to global score
	for goal in get_tree().get_nodes_in_group("goals"):
		var point = goal.get_node("OptionButton").get_selected_id()
		get_node("/root/Global").player_score += point
	print(get_node("/root/Global").player_score)
	
	get_tree().change_scene("res://scenes/Room.tscn")
	pass


func _on_mob_touched():
	var tween = get_node("Tween")
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property($Player, "modulate", start_color, end_color, 1.0)
	tween.start()
	print("aaaaaarrr I die...")
	pass


func _on_Tween_tween_completed(object, key):
	# remove Player when death animation end
	if object == $Player:
		$Player.queue_free()
	pass
