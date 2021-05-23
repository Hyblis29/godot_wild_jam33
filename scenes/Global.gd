extends Node


# Variables
const goals = "goals"
const choices = "choices"
const score = "score"
const word = "word"
const pos = "pos"
const mobs = "mobs"
const obstacles = "obstacles"
const scale = "scale"
const player_pos = "player_pos"
const instruction = "instruction"
const key = "key"

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
	{goals:[{choices:[{score:2, word:"word2"}, {score:9, word:"word9"}, {score:0, word:"word0"}], key:"      {Tonii:            }", pos:Vector2(504.493011, 515.195984)}, {choices:[{score:3, word:"Word3"}, {score:0, word:"Word0"}, {score:7, word:"Word7"}, {score:1, word:"Word1"}], key:"    {Toniieu:            }", pos:Vector2(769.280029, 377.122009)}], instruction:"blablablablablba\nfzef\n\nf\nez\n\n\n\nfzefezef\nfez\nfez", mobs:[[Vector2(623, 455), Vector2(365.044006, 458.76001), Vector2(358.140991, 560.502991), Vector2(657.046997, 562.484985), Vector2(623, 455)], [Vector2(659, 458), Vector2(631.281006, 312.661011), Vector2(894.119019, 297.424988), Vector2(899.640015, 448.825012), Vector2(659, 458)]], obstacles:[{pos:Vector2(502.40799, 362.570007), scale:Vector2(2, 2)}, {pos:Vector2(274.717987, 407.26001), scale:Vector2(1.64, 5.24)}, {pos:Vector2(744.484985, 209.354004), scale:Vector2(5.32, 1.36)}], player_pos:Vector2(221.285004, 168.281006)},
	{goals:[{choices:[{score:2, word:"word2"}, {score:9, word:"word9"}, {score:0, word:"word0"}], key:"      {Tonii:            }", pos:Vector2(504.493011, 515.195984)}, {choices:[{score:3, word:"Word3"}, {score:0, word:"Word0"}, {score:7, word:"Word7"}, {score:1, word:"Word1"}], key:"      {Tonii:            }", pos:Vector2(769.280029, 377.122009)}], instruction:"blablablablablba\nfzef\n\nf\nez\n\n\n\nfzefezef\nfez\nfez", mobs:[[Vector2(623, 455), Vector2(365.044006, 458.76001), Vector2(358.140991, 560.502991), Vector2(657.046997, 562.484985), Vector2(623, 455)], [Vector2(659, 458), Vector2(631.281006, 312.661011), Vector2(894.119019, 297.424988), Vector2(899.640015, 448.825012), Vector2(659, 458)]], obstacles:[{pos:Vector2(502.40799, 362.570007), scale:Vector2(2, 2)}, {pos:Vector2(274.717987, 407.26001), scale:Vector2(1.64, 5.24)}, {pos:Vector2(744.484985, 209.354004), scale:Vector2(5.32, 1.36)}], player_pos:Vector2(221.285004, 168.281006)},
	{instruction:"a", goals:[{choices:[{score:2, word:"word2"}, {score:9, word:"word9"}, {score:0, word:"word0"}], key:"      {Tonii:            }", pos:Vector2(504.493011, 515.195984)}, {choices:[{score:3, word:"Word3"}, {score:0, word:"Word0"}, {score:7, word:"Word7"}, {score:1, word:"Word1"}], key:"      {Tonii:            }", pos:Vector2(769.280029, 377.122009)}], mobs:[[Vector2(623, 455), Vector2(365.044006, 458.76001), Vector2(358.140991, 560.502991), Vector2(657.046997, 562.484985), Vector2(623, 455)], [Vector2(659, 458), Vector2(631.281006, 312.661011), Vector2(894.119019, 297.424988), Vector2(899.640015, 448.825012), Vector2(659, 458)]], obstacles:[{pos:Vector2(502.40799, 362.570007), scale:Vector2(2, 2)}, {pos:Vector2(274.717987, 407.26001), scale:Vector2(1.64, 5.24)}, {pos:Vector2(744.484985, 209.354004), scale:Vector2(5.32, 1.36)}], player_pos:Vector2(221.285004, 168.281006)},
	{instruction:"b", goals:[{choices:[{score:2, word:"word2"}, {score:9, word:"word9"}, {score:0, word:"word0"}], key:"      {Tonii:            }", pos:Vector2(539.198975, 560.580994)}, {choices:[{score:3, word:"Word3"}, {score:0, word:"Word0"}, {score:7, word:"Word7"}, {score:1, word:"Word1"}], key:"      {Tonii:            }", pos:Vector2(972.176025, 435.855011)}], mobs:[[Vector2(751, 472), Vector2(316.98999, 477.447998), Vector2(320.765015, 692.651978), Vector2(762.499023, 703.978027), Vector2(751, 472)], [Vector2(794, 472), Vector2(802.140991, 311.325989), Vector2(1134.390015, 309.438995), Vector2(1153.26001, 498.213989), Vector2(794, 472)]], obstacles:[{pos:Vector2(462.363007, 351.890991), scale:Vector2(2, 2)}, {pos:Vector2(177.274994, 524.726013), scale:Vector2(1.64, 5.24)}, {pos:Vector2(879.304016, 214.692993), scale:Vector2(5.32, 1.36)}], player_pos:Vector2(262.346008, 162.296005)},
	{instruction:"c", goals:[{choices:[{score:2, word:"Word"}], key:"      {Tonii:            }", pos:Vector2(500, 500)}], mobs:[[Vector2(200, 200), Vector2(300, 300), Vector2(200, 200)]], obstacles:[{pos:Vector2(400, 400), scale:Vector2(2, 2)}], player_pos:Vector2(100, 100)},
]
var player_score = 0
var endings = [
	"looser",
	"a bit lesss looser",
	"so so",
	"great",
	"bravo"
]


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


func end():
	# if there is no more level
	if level >= phone_datas.size():
		# return the ending dialog corresponding to player score
		return endings[player_score * endings.size() / 100]
	return null
