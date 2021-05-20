extends Node


# Variables
var level = 0
var phone = true # indicate if the player must see the phone or the computer
var phone_datas = [
	"level 0 blablablablablablbalbablbbal",
	"level 1 blablablablablablbalbablbbal",
	"level 2 blablablablablablbalbablbbal",
	"level 3 blablablablablablbalbablbbal",
	"level 4 blablablablablablbalbablbbal"
]
var computer_datas = [
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
					"score" : 0 # needs to be unique in choices
					},
					{
					"word" : "bbb",
					"score" : 2
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
					"score" : 4
					},
					{
					"word" : "eeeeeeeeee",
					"score" : 5
					},
					{
					"word" : "iiiiiiiiii",
					"score" : 6
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
					"score" : 10
					},
					{
					"word" : "bbb",
					"score" : 11
					},
					{
					"word" : "ccc",
					"score" : 12
					},
				]
			}
		]
	}
]
var player_score = 0


# Methods
func get_phone_datas():
	return phone_datas[level]


func get_computer_datas():
	return computer_datas[level]


func init():
	level = 0
	phone = true
	player_score = 0
	pass
