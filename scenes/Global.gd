extends Node


# Variables
var level = 0
var datas = [
	{ 
		"player_pos" : Vector2(100, 100),
		"mobs" : [
			[
				Vector2(600, 600),
				Vector2(700, 700),
				Vector2(800, 600),
				Vector2(600, 600)
			],
			[
				Vector2(500, 200),
				Vector2(500, 300),
				Vector2(700, 700),
				Vector2(600, 600),
				Vector2(800, 600),
				Vector2(500, 200)
			]
		],
		"obstacles" : [
			{
				"pos" : Vector2(300, 300),
				"scale" : Vector2(3, 2)
			},
						{
				"pos" : Vector2(900, 400),
				"scale" : Vector2(1, 5)
			}
		],
		"goals" : [
			{
				"pos" : Vector2(500, 500),
				"choices" : [
					{
					"word" : "aaa",
					"score" : 2 # needs to be unique in choices
					},
					{
					"word" : "bbb",
					"score" : 0
					},
					{
					"word" : "ccc",
					"score" : 3
					},
				]
			},
			{
				"pos" : Vector2(200, 600),
				"choices" : [
					{
					"word" : "dddddddddd",
					"score" : 1
					},
					{
					"word" : "eeeeeeeeee",
					"score" : 10
					},
					{
					"word" : "iiiiiiiiii",
					"score" : 0
					},
				]
			}
		]
	},
	{ 
		"player_pos" : Vector2(500, 100),
		"mobs" : [
			[
				Vector2(600, 600),
				Vector2(700, 700),
				Vector2(800, 600),
				Vector2(600, 600)
			]
		],
		"obstacles" : [
			{
				"pos" : Vector2(300, 300),
				"scale" : Vector2(3, 2)
			},
		],
		"goals" : [
			{
				"pos" : Vector2(500, 500),
				"choices" : [
					{
					"word" : "aaa",
					"score" : 2
					},
					{
					"word" : "bbb",
					"score" : 0
					},
					{
					"word" : "ccc",
					"score" : 3
					},
				]
			}
		]
	}
]
var player_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
