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
	"Hey Chummer. Thanks for helping us pushing the good guys of Slightly Better ahead in the elections, it's really time to end this corp-dominated era. We trust you to hack into the databases of these damn auto-generated news articles. Go on your computer for your first assignment. -J",
	"Hey, seems like it worked. Take a look at the window, these huge billboards are already showing a change in the polls. This time we need you to hack into a local news outlet, our candidate made a public speech and the medias are ready to lie about it. -J",
	"Hey, you did a good job last time. A lot of people are working hard to make our candidate win, and you're one of them. I have bad news though. Our leader was attacked in broad daylight - Make sure everybody knows this was an assassination attempt. -J",
	"Hey, we're getting there chummer. People start to believe that Slightly Better has its chances in the elections. We need to hit hard! Some rumors appeared saying that a foreign country endorsed our candidate. I don't know if it's true, but be sure the public broadcast says so. -J",
	"Hey, after all this work the election is almost there. I have one last task for you to help us secure the victory. The official debate happened last night, and it was so obviously staged it was painful to watch. Hack the official broadcast database and expose the facts. -J"
]
var computer_datas = [
	{goals:[{choices:[{score:1, word:"Hateful"}, {score:2, word:"Neutral"}, {score:3, word:"Praising"}], key:"       {Tone:         }", pos:Vector2(842.53302, 547.150024)}], instruction:"Objective:\nChange the tone of the article to *praising*\nby clicking\n\n\n\n-Access and modify data\n-Avoid bots", mobs:[[Vector2(260, 500), Vector2(290, 400), Vector2(240, 300), Vector2(240, 550), Vector2(260, 500)], [Vector2(450, 450), Vector2(450, 310), Vector2(880, 310), Vector2(880, 450), Vector2(450, 450)]], obstacles:[{pos:Vector2(662.815002, 379.229004), scale:Vector2(5, 1)}, {pos:Vector2(357.96701, 376.988007), scale:Vector2(1, 4)}, {pos:Vector2(731.031006, 218.604004), scale:Vector2(6, 2)}], player_pos:Vector2(435.285004, 228.281006)},
	{goals:[{choices:[{score:1, word:"Hateful"}, {score:2, word:"Neutral"}, {score:4, word:"Praising"}], key:"       {Tone:         }", pos:Vector2(842.53302, 547.150024)}, {choices:[{score:1, word:"Misquote"}, {score:2, word:"Random"}, {score:8, word:"Truthful"}], key:"     {Quotes:         }", pos:Vector2(560.536987, 193.468002)}], instruction:"Objective:\nSpeak highly of the recent speech\n\n\n\n\n-Access and modify data\n-Avoid bots", mobs:[[Vector2(260, 500), Vector2(290, 450), Vector2(450, 550), Vector2(240, 550), Vector2(260, 500)], [Vector2(800, 450), Vector2(880, 310), Vector2(450, 310), Vector2(880, 310), Vector2(880, 450), Vector2(800, 450)]], obstacles:[{pos:Vector2(531, 380), scale:Vector2(5, 1)}, {pos:Vector2(340.308014, 284), scale:Vector2(1, 4)}, {pos:Vector2(799.031006, 214.604004), scale:Vector2(4, 2)}], player_pos:Vector2(254.492004, 205.576996)},
	{goals:[{choices:[{score:1, word:"Unknown"}, {score:3, word:"Anger"}, {score:7, word:"Election"}], key:"     {Motive:         }", pos:Vector2(850.533997, 194.149994)}, {choices:[{score:1, word:"Unknown"}, {score:2, word:"Elderly"}, {score:8, word:"Assassin"}], key:"   {Attacker:         }", pos:Vector2(573.536987, 369.467987)}], instruction:"Objective:\nCreate empathy after the assassination attempt\n\n\n\n-Access and modify data\n-Avoid bots", mobs:[[Vector2(230, 550), Vector2(300, 300), Vector2(300, 550), Vector2(400, 550), Vector2(230, 550)], [Vector2(800, 450), Vector2(700, 330), Vector2(880, 350), Vector2(880, 450), Vector2(750, 550), Vector2(800, 450)], [Vector2(600, 200), Vector2(500, 220), Vector2(500, 170), Vector2(700, 220), Vector2(700, 170), Vector2(600, 200)]], obstacles:[{pos:Vector2(555, 267), scale:Vector2(5, 1)}, {pos:Vector2(555, 461), scale:Vector2(5, 1)}, {pos:Vector2(360, 364), scale:Vector2(1, 4)}, {pos:Vector2(817.031006, 267.604004), scale:Vector2(3, 1)}], player_pos:Vector2(254.492004, 205.576996)},
	{goals:[{choices:[{score:1, word:"Unknown"}, {score:8, word:"Major"}, {score:5, word:"Minor"}], key:"    {Country:         }", pos:Vector2(406.533997, 556.150024)}, {choices:[{score:1, word:"Rumors"}, {score:6, word:"Embassy"}, {score:3, word:"Secret"}], key:"     {Source:         }", pos:Vector2(744.536987, 553.468018)}], instruction:"Objective:\nEmbelish rumors on foreign support\n\n\n\n\n-Access and modify data\n-Avoid bots", mobs:[[Vector2(380, 430), Vector2(700, 430), Vector2(700, 250), Vector2(700, 430), Vector2(380, 430)], [Vector2(875, 550), Vector2(829, 471), Vector2(901, 395), Vector2(826, 310), Vector2(866, 207), Vector2(697, 173), Vector2(697, 249), Vector2(865, 206), Vector2(827, 310), Vector2(901, 395), Vector2(829, 471), Vector2(875, 550)], [Vector2(250, 500), Vector2(460, 500), Vector2(350, 500), Vector2(250, 500)]], obstacles:[{pos:Vector2(768, 391), scale:Vector2(1, 4)}, {pos:Vector2(542, 551), scale:Vector2(1, 1)}, {pos:Vector2(431, 331), scale:Vector2(7, 2)}, {pos:Vector2(638.031006, 486.604004), scale:Vector2(3, 1)}], player_pos:Vector2(254.492004, 205.576996)},
	{goals:[{choices:[{score:1, word:"Huge"}, {score:5, word:"Usual"}, {score:15, word:"Neutral"}], key:"       {bias:         }", pos:Vector2(816.174988, 188.039001)}], instruction:"Objective:\nShow the debate as it is: propaganda\n\n\n\n\n-Access and modify data\n-Avoid bots", mobs:[[Vector2(300, 180), Vector2(500, 180), Vector2(300, 180)], [Vector2(300, 560), Vector2(500, 560), Vector2(300, 560)], [Vector2(710, 350), Vector2(710, 480), Vector2(850, 480), Vector2(850, 350), Vector2(710, 350)], [Vector2(850, 350), Vector2(850, 480), Vector2(710, 480), Vector2(710, 350), Vector2(850, 350)], [Vector2(900, 480), Vector2(900, 280), Vector2(710, 280), Vector2(900, 280), Vector2(900, 480)]], obstacles:[{pos:Vector2(628.598022, 281.566986), scale:Vector2(1, 4)}, {pos:Vector2(785.070984, 413.194), scale:Vector2(1, 1)}, {pos:Vector2(407.403015, 371.622009), scale:Vector2(1, 5)}, {pos:Vector2(803.703979, 550.843994), scale:Vector2(4, 1)}], player_pos:Vector2(244.108994, 369.811005)}
]
var player_score = 0
var endings = [
	"Hey... I guess you heard the news - or seen them outside. I really believed that this time we could change something in this damn city, but maybe the corps really had us since the beginning. I... I guess you should hide now. Sorry again. -J",
	"Hey... Well I guess you've seen the results. Slightly Better lost, but even us idealistic folks knew that winning against the propaganda machine was near impossible. But results that high for the opposition are unheard of, and the anger is rising. Keep wired, we may need you. -J",
	"I... I just can't believe it. Seventy years that A.L.L.P.O.L. is controlling everything and everyone, and here we are. Slightly Better rose to power, legally, against all odds, against the most horrendous propaganda. Thank you, thank you again. -J",
	"I'm not sure what otherwordly sorcery you did to manage these results, but you clearly stole the show.",
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
