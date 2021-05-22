extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var level_datas = {}
	
	# player
	level_datas["player_pos"] = $Player.position
	
	# instruction
	level_datas["instruction"] = "\"" + $Instruction.text.replacen("\n", "\\n") + "\""
	
	# mobs
	level_datas["mobs"] = []
	
	for i in range ($Mobs.get_child_count()):
		level_datas["mobs"].append([])
		var mobpath_node = $Mobs.get_child(i)  # MobPath0
		var pos0 = mobpath_node.position
		level_datas["mobs"][i].append(pos0)
		
		for j in range (mobpath_node.get_node("Positions").get_child_count()):
			# MobPath0/Positions/Position0
			var pos = mobpath_node.get_node("Positions").get_child(j).position
			level_datas["mobs"][i].append(pos)
		
		# mob path ends on initial position
		level_datas["mobs"][i].append(pos0) 
	
	# obstacles
	level_datas["obstacles"] = []
	
	for i in range ($Obstacles.get_child_count()):
		level_datas["obstacles"].append({
			"pos" : $Obstacles.get_child(i).position,
			"scale" : $Obstacles.get_child(i).scale
		})
	
	# goals
	level_datas["goals"] = []
	
	for i in range ($Goals.get_child_count()):
		var goal_node = $Goals.get_child(i)  # Goal0
		level_datas["goals"].append({
			"pos" : goal_node.position,
			"choices" : []
		})
		
		for j in range (goal_node.get_node("Labels").get_child_count()):
			# Goal0/Labels/Label0
			var label = goal_node.get_node("Labels").get_child(j).text.split(":")
			level_datas["goals"][i]["choices"].append({
				"word" : "\"" + label[0] + "\"",
				"score" : label[1]
			})
	
	# print level datas
	var pretty_level_datas = String(level_datas).replacen("(", "Vector2(").replacen("\"\"", "\"")
	print(pretty_level_datas)
	
	# quit game
	get_tree().quit()
	pass

