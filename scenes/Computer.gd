extends Node2D


export (PackedScene) var Mob
export (PackedScene) var Obstacle
export (PackedScene) var Goal


# Variables
var datas = [
	{ 
		"player_pos" : Vector2(100, 100),
		"mobs" : [
			[
				Vector2(10, 10),
				Vector2(20, 20)
			]
		],
		"obstacles" : [
			{
				"pos" : Vector2(300, 300),
				"height" : 40,
				"width" : 20
			}
		],
		"goals" : [
			{
				"pos" : Vector2(500, 500),
				"choices" : [
					"aaa",
					"bbb",
					"ccc"
				]
			}
		]
	}
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func start(level):
	# Player initialization
	$Player.position = datas[level]["player_pos"]
	
	# Mobs initialization
	for mob_datas in datas[level]["mobs"]:
		var mob = Mob.instance()
		mob.init(mob_datas)
		add_child(mob)
		
	# Obstacles initialization
	for obs_datas in datas[level]["obstacles"]:
		var obstacle = Obstacle.instance()
		obstacle.init(obs_datas["pos"], obs_datas["height"], obs_datas["width"])
		add_child(obstacle)
		
	# Goals initialization
	for goa_datas in datas[level]["goals"]:
		var goal = Goal.instance()
		goal.init(goa_datas["pos"], goa_datas["choices"])
		add_child(goal)
	pass


func _on_Shutdown_pressed():
	get_tree().change_scene("res://scenes/Room.tscn")
	pass # Replace with function body.
