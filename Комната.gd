extends Node2D

onready var sl = get_node("/root/Slojnost")
onready var dari_1 = get_node("/root/Dari/Дар_1")


var pred_rooms = [
	[
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0]
	],
	[
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0]
	],
	[
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0]
	],
]
var pred_monsters = [ [],[],[] ]
var pred_param = [
	[false, 0, false, 0],
	[false, 0, false, 0],
	[false, 0, false, 0]
]
var i_hod = 0
var bul_dial = false

var Pole = [ # маленький гребель - это комната
		[
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			],
		
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			],
		
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			]
		],
	
	
		[
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			],
		
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			],
	
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			]
		],
	
	
		[
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			],
		
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			],
		
			[
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				],
				[
					[],[],[],[],[],[],[],[],[]
				]
			]
		],
]
var monster_table = []
var room_mass = []
var hod_lock = false
var prop_hod_vr = false
var monster_HP_visible = false
var Z = 0
var K = 0 
var L = 0
var N = 0
var M = 0
var m = 0
var k = 0
var z = 0
var x_pred = 0
var y_pred = 0

var boss_battle = 0
var phase_flag = 0
var x_10 = 0
var y_10 = 0

var sl_text = []
var dialog_phase = 0

var vub_flag = 0
var serd_est = false

var kol_podz = -10
var nom_podz = -10
var kol_soxr = [-10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10]
var kol_serd = [-10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10]
var kol_sl_serd = -10
var kol_smert = [-10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10]
var min_hero_sila = 0
var isp_1sp = false
var sch_10 = 0
var isp_kl = [
		[
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		],
		[
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		],
		[
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		]
]
var podsk = []


func _ready():
	$"/root/VudrYachSoxr".text = '1'
	###
	
	var pul = $"Подсказки/Набор подсказок".text.split("\n|")
	var sl_nom = 0
	var i = 0
	
	print(sl.text)
	Pole = load_save(Pole, monster_table, false)
	rasst(Pole[z][k][m], room_mass, 0)
	match nom_podz:
		1:
			$"Местонахождение".text = "Подземный дворец Святой Десятки. Этаж " + str(z + 1)
			$"Неизменная часть/floor_1".visible = true
		2:
			$"Местонахождение".text = "Библиотека Двадцадота. Этаж " + str(z + 1)
			$"Неизменная часть/floor_2".visible = true
	
	randomize()
	while pul.size() > 0:
		if i == 0:
			sl_nom = randi()%(pul.size() - 1) + 1
		else:
			if i == 1:
				sl_nom = 0
			else:
				sl_nom = randi()%pul.size()
		podsk.append(pul[sl_nom])
		pul.remove(sl_nom)
		i += 1
#	for j in podsk:
#		print(j)
func _process(delta):
	randomize()
	if $"Узел подсказки".visible == true:
		$"Узел подсказки".position = get_viewport().get_mouse_position()
		$"Узел подсказки".position.x -= 212
		$"Узел подсказки".position.y -= 34
	if bul_dial == true && i_hod == 0 && $"Диалоговое окно".visible == false:
		bul_dial = false
	if i_hod < 2:
		if pred_rooms[i_hod + 1][0][0] != 0 && i_hod < 3 - int(sl.text):
			$"pred_position".visible = true
	if $"Тьма".z_index == 3:
		$"Shesternya_Menu".visible = false
		$"pred_position".visible = false
		$"sl_position".visible = false
	if $"Оповещение о смерти и сохранениях".modulate.a > 0 && $"Оповещение о смерти и сохранениях".visible:
		$"Оповещение о смерти и сохранениях".modulate.a -= delta/8
	else:
		$"Оповещение о смерти и сохранениях".visible = false
	
	if hod_lock == false:
		var deistv = Input.is_action_just_pressed("ui_right") || Input.is_action_just_pressed("ui_left") || Input.is_action_just_pressed("ui_down") || Input.is_action_just_pressed("ui_up") || Input.is_action_just_pressed("1sp")
		if deistv:
			if $"Оповещения о сердцах".visible == true:
				$"Оповещения о сердцах".visible = false
			if $"Подсказки".visible == true:
				$"Подсказки".visible = false
			Pole = hero_turn(Pole, N, M, z, k, m)
			if !Input.is_action_just_pressed("1sp") && prop_hod_vr == false:
				pluh(N, M)
				hod_vr(room_mass, N, M)
				boss_10(N, M)
				for i in range(0, N):
					for j in range(0, M):
						if Pole[z][k][m][i][j] >= 40 && Pole[z][k][m][i][j] <= 48:
							if z == 2 && k == 0 && m == 0:
								Pole[z][k][m][i][j] -= 39
								game_end()
				Pole = perehod(Pole, N, M, room_mass, monster_table)
				razr_serd(N, M, [0])
				vosst_serd(N, M, [0])
				pred_hod(N, M)
				if  int(dari_1.text) == 1:
					if sch_10 > 0 && isp_1sp == false:
						sch_10 -= 1
			if prop_hod_vr == true:
				prop_hod_vr = false
			monster_HPv()
			Pole = poisk_smerti(Pole)
			if serd_est:
				if kol_soxr[nom_podz - 1] < (3 - int(sl.text)) * 3:
					if (int(sl.text) == 2 && kol_soxr[nom_podz - 1]%2 == 0) || int(sl.text) == 1:
						kol_soxr[nom_podz - 1] += 1
						save_save()
						$"Оповещение о смерти и сохранениях/Текст".text = "Игра сохранена"
						$"Оповещение о смерти и сохранениях".modulate.a = 1
						$"Оповещение о смерти и сохранениях".visible = true
				serd_est = false
			snat_vse()
			rasst(Pole[z][k][m], room_mass, 0)
	else:
		$"OneHero/AnimationPlayer".stop()
		
	$"Lamp/Анимация огня".play("Fire")
	if hod_lock == false:
		$"Кристаллическое сердце/AnimationPlayer".play("Levit")
		$"OneHero/AnimationPlayer".play("Morg")


func rasst(room, monsters_r, pred):
	var nom = 1
	var noms = [1, 1, 1, 1, 1, 1, 1]
	var type = 0
	for i in range(0,N):
		for j in range(0,M):
			match room[i][j]:
				10:$"Святая Десятка".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
				29:$"Кристаллическое сердце".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
				30:$"Осколки кристаллического сердца".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
				79:$"Лестница вниз".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
				19:$"Лестница вверх".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
				-10:if komn_bossa(pred):
						$"Враги/Гигантская Королева Пауков".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
	
	for i in range(0,N):
		for j in range(0,M):
			if room[i][j] >= 1 && room[i][j] <= 9:
				if room[i][j] > 1:
					$"OneHero/HitPoint".text = str(room[i][j])
					$"OneHero/HitPoint".visible = true
				else:
					$"OneHero/HitPoint".visible = false
				$OneHero.position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
	for i in range(0,N):
		for j in range(0,M):
			if room[i][j] == 109:
				nom = rasst_klon_1(nom, i, j)
	nom = 1
	if komn_bossa(pred):
		for i in range(1,N - 1):
			for j in range(1,M - 1):
				if room[i][j] == 100:
					if !((i == 1 && j == 1) || (i == 1 && j == M - 2) || (i == N - 2 && j == M - 2) || (i == N - 2 && j == 1)):
						nom = rasst_100(nom, i, j)
	else:
		for i in range(2,N - 2):
			for j in range(2,M - 2):
				if room[i][j] == 100:
					nom = rasst_100(nom, i, j)
	if !komn_bossa(pred):
		rasst_vx_vux(room, nom)
	
	nom = 1
	for i in range(0,N):
		for j in range(0,M):
			if room[i][j] < 0:
				type = 0
				for k in range(0, monsters_r.size()):
					if monsters_r[k].x == j && monsters_r[k].y == i:
						type = monsters_r[k].type
						break
				if type > 0:
					match type:
						1:noms[0] = rasst_otr_1(room, noms[0], i, j)
						2:noms[1] = rasst_otr_2(room, noms[1], i, j)
						3:noms[2] = rasst_otr_3(room, noms[2], i, j)
						5:noms[3] = rasst_otr_5(room, noms[3], i, j)
						7:noms[4] = rasst_otr_7(room, noms[4], i, j)
						8:noms[5] = rasst_otr_8(room, noms[5], i, j)
						9:noms[6] = rasst_otr_9(room, noms[6], i, j)
				else:
					if !komn_bossa(pred):
						noms[0] = rasst_otr_1(room, noms[0], i, j)
func rasst_klon_1(nom,i,j):
	match nom:
		1:$"Клоны главного героя/Клон_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		2:$"Клоны главного героя/Клон_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		3:$"Клоны главного героя/Клон_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
	nom += 1
	return nom
func rasst_otr_1(room, nom,i,j):
	match nom:
		1:
			$"Враги/-единицы/-1_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_1/HP".text = str(-room[i][j])
		2:
			$"Враги/-единицы/-1_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_2/HP".text = str(-room[i][j])
		3:
			$"Враги/-единицы/-1_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_3/HP".text = str(-room[i][j])
		4:
			$"Враги/-единицы/-1_4".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_4/HP".text = str(-room[i][j])
		5:
			$"Враги/-единицы/-1_5".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_5/HP".text = str(-room[i][j])
		6:
			$"Враги/-единицы/-1_6".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_6/HP".text = str(-room[i][j])
		7:
			$"Враги/-единицы/-1_7".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_7/HP".text = str(-room[i][j])
		8:
			$"Враги/-единицы/-1_8".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_8/HP".text = str(-room[i][j])
		9:
			$"Враги/-единицы/-1_9".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_9/HP".text = str(-room[i][j])
		10:
			$"Враги/-единицы/-1_10".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-единицы/-1_10/HP".text = str(-room[i][j])
	nom += 1
	return nom
func rasst_100(nom,i,j):
	match nom:
		1:$"Камни/Обломки_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		2:$"Камни/Обломки_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		3:$"Камни/Обломки_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		4:$"Камни/Обломки_4".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		5:$"Камни/Обломки_5".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		6:$"Камни/Обломки_6".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		7:$"Камни/Обломки_7".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		8:$"Камни/Обломки_8".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		9:$"Камни/Обломки_9".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		10:$"Камни/Обломки_10".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		11:$"Камни/Обломки_11".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		12:$"Камни/Обломки_12".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		13:$"Камни/Обломки_13".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		14:$"Камни/Обломки_14".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
		15:$"Камни/Обломки_15".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
	nom += 1
	return nom
func rasst_otr_2(room, nom,i,j):
	match nom:
		1:
			$"Враги/-двойки/-2_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-двойки/-2_1/HP".text = str(-room[i][j])
		2:
			$"Враги/-двойки/-2_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-двойки/-2_2/HP".text = str(-room[i][j])
		3:
			$"Враги/-двойки/-2_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-двойки/-2_3/HP".text = str(-room[i][j])
		4:
			$"Враги/-двойки/-2_4".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-двойки/-2_4/HP".text = str(-room[i][j])
		5:
			$"Враги/-двойки/-2_5".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-двойки/-2_5/HP".text = str(-room[i][j])
	nom += 1
	return nom
func rasst_otr_3(room, nom,i,j):
	match nom:
		1:
			$"Враги/-тройки/-3_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-тройки/-3_1/HP".text = str(-room[i][j])
		2:
			$"Враги/-тройки/-3_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-тройки/-3_2/HP".text = str(-room[i][j])
		3:
			$"Враги/-тройки/-3_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-тройки/-3_3/HP".text = str(-room[i][j])
		4:
			$"Враги/-тройки/-3_4".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-тройки/-3_4/HP".text = str(-room[i][j])
		5:
			$"Враги/-тройки/-3_5".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-тройки/-3_5/HP".text = str(-room[i][j])
	nom += 1
	return nom
func rasst_otr_5(room, nom,i,j):
	match nom:
		1:
			$"Враги/-пятерки/-5_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-пятерки/-5_1/HP".text = str(-room[i][j])
		2:
			$"Враги/-пятерки/-5_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-пятерки/-5_2/HP".text = str(-room[i][j])
		3:
			$"Враги/-пятерки/-5_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-пятерки/-5_3/HP".text = str(-room[i][j])
		4:
			$"Враги/-пятерки/-5_4".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-пятерки/-5_4/HP".text = str(-room[i][j])
		5:
			$"Враги/-пятерки/-5_5".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-пятерки/-5_5/HP".text = str(-room[i][j])
	nom += 1
	return nom
func rasst_otr_7(room, nom,i,j):
	match nom:
		1:
			$"Враги/-семерки/-7_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-семерки/-7_1/HP".text = str(-room[i][j])
		2:
			$"Враги/-семерки/-7_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-семерки/-7_2/HP".text = str(-room[i][j])
		3:
			$"Враги/-семерки/-7_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-семерки/-7_3/HP".text = str(-room[i][j])
	nom += 1
	return nom
func rasst_otr_8(room, nom,i,j):
	match nom:
		1:
			$"Враги/-восьмерки/-8_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-восьмерки/-8_1/HP".text = str(-room[i][j])
		2:
			$"Враги/-восьмерки/-8_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-восьмерки/-8_2/HP".text = str(-room[i][j])
		3:
			$"Враги/-восьмерки/-8_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-восьмерки/-8_3/HP".text = str(-room[i][j])
	nom += 1
	return nom
func rasst_otr_9(room, nom,i,j):
	match nom:
		1:
			$"Враги/-девятки/-9_1".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-девятки/-9_1/HP".text = str(-room[i][j])
		2:
			$"Враги/-девятки/-9_2".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-девятки/-9_2/HP".text = str(-room[i][j])
		3:
			$"Враги/-девятки/-9_3".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-девятки/-9_3/HP".text = str(-room[i][j])
		4:
			$"Враги/-девятки/-9_4".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-девятки/-9_4/HP".text = str(-room[i][j])
		5:
			$"Враги/-девятки/-9_5".position = Vector2(-3 + 32 + 64*j,-14 + 32 + 64*i)
			$"Враги/-девятки/-9_5/HP".text = str(-room[i][j])
	nom += 1
	return nom
func rasst_vx_vux(room, kol_kamn):
	if room[0][4] == 100 && room[1][4] == 100:
		$"vx_vux/blok_1".position = Vector2(253,50)
	else:
		$"vx_vux/vux_vert_1".position = Vector2(253,50)
		if room[0][4] == 100:
			kol_kamn = rasst_100(kol_kamn,0,4)
		else:
			if room[1][4] == 100:
				kol_kamn = rasst_100(kol_kamn,1,4)
	
	if room[4][7] == 100 && room[4][8] == 100:
		$"vx_vux/blok_2".position = Vector2(509,306)
	else:
		$"vx_vux/vux_gor_1".position = Vector2(509,242)
		if room[4][7] == 100:
			kol_kamn = rasst_100(kol_kamn,4,7)
		else:
			if room[4][8] == 100:
				kol_kamn = rasst_100(kol_kamn,4,8)
	
	if room[7][4] == 100 && room[8][4] == 100:
		$"vx_vux/blok_4".position = Vector2(253,498)
	else:
		$"vx_vux/vux_vert_2".position = Vector2(253,498)
		if room[7][4] == 100:
			kol_kamn = rasst_100(kol_kamn,7,4)
		else:
			if room[8][4] == 100:
				kol_kamn = rasst_100(kol_kamn,8,4)
	
	if room[4][0] == 100 && room[4][1] == 100:
		$"vx_vux/blok_3".position = Vector2(61,306)
	else:
		$"vx_vux/vux_gor_2".position = Vector2(61,242)
		if room[4][0] == 100:
			kol_kamn = rasst_100(kol_kamn,4,0)
		else:
			if room[4][1] == 100:
				kol_kamn = rasst_100(kol_kamn,4,1)
func snat_vse():
	$OneHero.position = Vector2(-384, 304)
	$"Святая Десятка".position = Vector2(-384, 240)
	$"Кристаллическое сердце".position = Vector2(-256, -16)
	$"Осколки кристаллического сердца".position = Vector2(-256, 176)
	$"Лестница вниз".position = Vector2(-256, 240)
	$"Лестница вверх".position = Vector2(-320, 240)
	$"Враги/Гигантская Королева Пауков".position = Vector2(512, -80)
	
	$"Клоны главного героя/Клон_1".position = Vector2(-320,304)
	$"Клоны главного героя/Клон_2".position = Vector2(-320,304)
	$"Клоны главного героя/Клон_3".position = Vector2(-320,304)
	
	$"vx_vux/blok_1".position = Vector2(-288, -112)
	$"vx_vux/blok_2".position = Vector2(-352, -112)
	$"vx_vux/blok_3".position = Vector2(-352, -48)
	$"vx_vux/blok_4".position = Vector2(-480, -112)
	$"vx_vux/vux_gor_1".position = Vector2(-544, -176)
	$"vx_vux/vux_gor_2".position = Vector2(-544, -368)
	$"vx_vux/vux_vert_1".position = Vector2(-352, -240)
	$"vx_vux/vux_vert_2".position = Vector2(-352, -369)
	
	$"Камни/Обломки_1".position = Vector2(-384, -16)
	$"Камни/Обломки_2".position = Vector2(-320, -16)
	$"Камни/Обломки_3".position = Vector2(-384, 48)
	$"Камни/Обломки_4".position = Vector2(-320, 48)
	$"Камни/Обломки_5".position = Vector2(-256, 48)
	$"Камни/Обломки_6".position = Vector2(-384, 112)
	$"Камни/Обломки_7".position = Vector2(-320, 112)
	$"Камни/Обломки_8".position = Vector2(-256, 112)
	$"Камни/Обломки_9".position = Vector2(-384, 176)
	$"Камни/Обломки_10".position = Vector2(-320, 176)
	$"Камни/Обломки_11".position = Vector2(-384, 368)
	$"Камни/Обломки_12".position = Vector2(-320, 368)
	$"Камни/Обломки_13".position = Vector2(-256, 368)
	$"Камни/Обломки_14".position = Vector2(-384, 432)
	$"Камни/Обломки_15".position = Vector2(-320, 432)
	
	$"Враги/-единицы/-1_1".position = Vector2(-192, -272)
	$"Враги/-единицы/-1_2".position = Vector2(-128, -272)
	$"Враги/-единицы/-1_3".position = Vector2(-64, -272)
	$"Враги/-единицы/-1_4".position = Vector2(-192, -208)
	$"Враги/-единицы/-1_5".position = Vector2(-128, -208)
	$"Враги/-единицы/-1_6".position = Vector2(-64, -208)
	$"Враги/-единицы/-1_7".position = Vector2(-192, -144)
	$"Враги/-единицы/-1_8".position = Vector2(-128, -144)
	$"Враги/-единицы/-1_9".position = Vector2(-64, -144)
	$"Враги/-единицы/-1_10".position = Vector2(-192, -80)
	
	$"Враги/-двойки/-2_1".position = Vector2(-3, -272)
	$"Враги/-двойки/-2_2".position = Vector2(61, -272)
	$"Враги/-двойки/-2_3".position = Vector2(125, -272)
	$"Враги/-двойки/-2_4".position = Vector2(-3, -208)
	$"Враги/-двойки/-2_5".position = Vector2(61, -208)
	
	$"Враги/-тройки/-3_1".position = Vector2(-3, -144)
	$"Враги/-тройки/-3_2".position = Vector2(61, -144)
	$"Враги/-тройки/-3_3".position = Vector2(125, -144)
	$"Враги/-тройки/-3_4".position = Vector2(-3, -80)
	$"Враги/-тройки/-3_5".position = Vector2(61, -80)
	
	$"Враги/-пятерки/-5_1".position = Vector2(192, -272)
	$"Враги/-пятерки/-5_2".position = Vector2(256, -272)
	$"Враги/-пятерки/-5_3".position = Vector2(320, -272)
	$"Враги/-пятерки/-5_4".position = Vector2(192, -208)
	$"Враги/-пятерки/-5_5".position = Vector2(256, -208)
	
	$"Враги/-семерки/-7_1".position = Vector2(192, -144)
	$"Враги/-семерки/-7_2".position = Vector2(256, -144)
	$"Враги/-семерки/-7_3".position = Vector2(320, -144)
	
	$"Враги/-восьмерки/-8_1".position = Vector2(192, -80)
	$"Враги/-восьмерки/-8_2".position = Vector2(256, -80)
	$"Враги/-восьмерки/-8_3".position = Vector2(320, -80)
	
	$"Враги/-девятки/-9_1".position = Vector2(384, -144)
	$"Враги/-девятки/-9_2".position = Vector2(448, -144)
	$"Враги/-девятки/-9_3".position = Vector2(512, -144)
	$"Враги/-девятки/-9_4".position = Vector2(384, -80)
	$"Враги/-девятки/-9_5".position = Vector2(448, -80)

func monster_HPv():
	var hero_HP = 0
	for i in range(0, N):
		for j in range(0, M):
			if Pole[z][k][m][i][j] >= 1 && Pole[z][k][m][i][j] <= 10:
				hero_HP = Pole[z][k][m][i][j]
	if hero_HP >= 3:
		if monster_HP_visible == false || (monster_HP_visible && $"Враги/-единицы/-1_1/HP".visible == false):
			$"Враги/-единицы/-1_1/HP".visible = true
			$"Враги/-единицы/-1_2/HP".visible = true
			$"Враги/-единицы/-1_3/HP".visible = true
			$"Враги/-единицы/-1_4/HP".visible = true
			$"Враги/-единицы/-1_5/HP".visible = true
			$"Враги/-единицы/-1_6/HP".visible = true
			$"Враги/-единицы/-1_7/HP".visible = true
			$"Враги/-единицы/-1_8/HP".visible = true
			$"Враги/-единицы/-1_9/HP".visible = true
			$"Враги/-единицы/-1_10/HP".visible = true
			
			$"Враги/-двойки/-2_1/HP".visible = true
			$"Враги/-двойки/-2_2/HP".visible = true
			$"Враги/-двойки/-2_3/HP".visible = true
			$"Враги/-двойки/-2_4/HP".visible = true
			$"Враги/-двойки/-2_5/HP".visible = true
			
			$"Враги/-тройки/-3_1/HP".visible = true
			$"Враги/-тройки/-3_2/HP".visible = true
			$"Враги/-тройки/-3_3/HP".visible = true
			$"Враги/-тройки/-3_4/HP".visible = true
			$"Враги/-тройки/-3_5/HP".visible = true
			
			$"Враги/-пятерки/-5_1/HP".visible = true
			$"Враги/-пятерки/-5_2/HP".visible = true
			$"Враги/-пятерки/-5_3/HP".visible = true
			$"Враги/-пятерки/-5_4/HP".visible = true
			$"Враги/-пятерки/-5_5/HP".visible = true
			
			$"Враги/-семерки/-7_1/HP".visible = true
			$"Враги/-семерки/-7_2/HP".visible = true
			$"Враги/-семерки/-7_3/HP".visible = true
			
			$"Враги/-восьмерки/-8_1/HP".visible = true
			$"Враги/-восьмерки/-8_2/HP".visible = true
			$"Враги/-восьмерки/-8_3/HP".visible = true
			
			$"Враги/-девятки/-9_1/HP".visible = true
			$"Враги/-девятки/-9_2/HP".visible = true
			$"Враги/-девятки/-9_3/HP".visible = true
			$"Враги/-девятки/-9_4/HP".visible = true
			$"Враги/-девятки/-9_5/HP".visible = true
			
			monster_HP_visible = true
			
			if hero_HP == 3:
				$"Оповещения о сердцах/Сообщение".text = "Вы получили достаточное количество\nпозитивной энергии, чтобы увидеть то,\nчто было скрыто от Вас раньше."
				$"Оповещения о сердцах".visible = true
	else:
		if monster_HP_visible == true || (!monster_HP_visible && $"Враги/-единицы/-1_1/HP".visible == true):
			$"Враги/-единицы/-1_1/HP".visible = false
			$"Враги/-единицы/-1_2/HP".visible = false
			$"Враги/-единицы/-1_3/HP".visible = false
			$"Враги/-единицы/-1_4/HP".visible = false
			$"Враги/-единицы/-1_5/HP".visible = false
			$"Враги/-единицы/-1_6/HP".visible = false
			$"Враги/-единицы/-1_7/HP".visible = false
			$"Враги/-единицы/-1_8/HP".visible = false
			$"Враги/-единицы/-1_9/HP".visible = false
			$"Враги/-единицы/-1_10/HP".visible = false
			
			$"Враги/-двойки/-2_1/HP".visible = false
			$"Враги/-двойки/-2_2/HP".visible = false
			$"Враги/-двойки/-2_3/HP".visible = false
			$"Враги/-двойки/-2_4/HP".visible = false
			$"Враги/-двойки/-2_5/HP".visible = false
			
			$"Враги/-тройки/-3_1/HP".visible = false
			$"Враги/-тройки/-3_2/HP".visible = false
			$"Враги/-тройки/-3_3/HP".visible = false
			$"Враги/-тройки/-3_4/HP".visible = false
			$"Враги/-тройки/-3_5/HP".visible = false
			
			$"Враги/-пятерки/-5_1/HP".visible = false
			$"Враги/-пятерки/-5_2/HP".visible = false
			$"Враги/-пятерки/-5_3/HP".visible = false
			$"Враги/-пятерки/-5_4/HP".visible = false
			$"Враги/-пятерки/-5_5/HP".visible = false
			
			$"Враги/-семерки/-7_1/HP".visible = false
			$"Враги/-семерки/-7_2/HP".visible = false
			$"Враги/-семерки/-7_3/HP".visible = false
			
			$"Враги/-восьмерки/-8_1/HP".visible = false
			$"Враги/-восьмерки/-8_2/HP".visible = false
			$"Враги/-восьмерки/-8_3/HP".visible = false
			
			$"Враги/-девятки/-9_1/HP".visible = false
			$"Враги/-девятки/-9_2/HP".visible = false
			$"Враги/-девятки/-9_3/HP".visible = false
			$"Враги/-девятки/-9_4/HP".visible = false
			$"Враги/-девятки/-9_5/HP".visible = false
			
			monster_HP_visible = false


func step(a,x):
	var rez = 1
	while x > 0:
		rez = rez * a
		x -= 1
	return (rez)
func prisv_mass_2D(kuda, otkuda, N, M):
	for i in range(0, N):
		for j in range(0, M):
			kuda[i][j] = otkuda[i][j]

func mini_load(save, kol_simv):
	var chislo = 0
	var simv = 0
	var minus = false
	
	for i in range(0, kol_simv):
		simv = save.get_8()
		if simv == 45:
			minus = true
		else:
			if simv >= 48 && simv <= 57:
				chislo = (simv - 48) + chislo * 10
	if minus:
		chislo = -chislo
	return(chislo)
func poisk_sim(save, sim, kol_prop_sim):
	var c = 0

	#print("new")
	while true:
		c = save.get_8()
		#print(c)
		if c == int(sim):
			if kol_prop_sim == 0:
				break
			else:
				kol_prop_sim -= 1
		else:
			if c == 0:
				print("Символ не найден.")
				break
func load_save(Pol, table, smert_est):
	var put = ""
	var save = File.new()
	var dop = File.new()
	var kol_mon = 0
	var razm = 0
	var c = 0
	var ch = 0
	
	put = "res://Текстовые файлы/save_slot_" + $"/root/VudrYachSoxr".text + ".txt"
	save.open(put, File.READ) #начало загрузки
	# запасное место для метапеременных
	# запасное место для метапеременных
	poisk_sim(save, 83, 0)   # S - 83
	kol_podz = mini_load(save, 3)
	nom_podz = mini_load(save, 3)
	for i_dop in range(0, 11):
		kol_soxr[i_dop] = mini_load(save, 3)
	for i_dop in range(0, 11):
		ch = mini_load(save, 3)
		if !smert_est:
			kol_serd[i_dop] = ch
	kol_sl_serd = mini_load(save, 3)
	#print(nom_podz,kol_soxr, kol_serd)
	for i_dop in range(0, 11):
		ch = mini_load(save, 3)
		if !smert_est:
			kol_smert[i_dop] = ch
	for i_dop in range(1, 11):
		var adr = "/root/Dari/Дар_" + str(i_dop)
		get_node(adr).text = str(mini_load(save, 3))
	
	x_pred = mini_load(save, 3)
	y_pred = mini_load(save, 3)
	boss_battle = mini_load(save, 3)
	phase_flag = mini_load(save, 3)
	dialog_phase = mini_load(save, 3)
	match mini_load(save, 3):
		0: vub_flag = false
		1: vub_flag = true
	m = mini_load(save, 3)
	k = mini_load(save, 3)
	z = mini_load(save, 3)
	min_hero_sila = mini_load(save, 3)
	#print(kol_smert, m, k, z, min_hero_sila)
	sch_10 = mini_load(save, 3)
	match mini_load(save, 3):
		0: monster_HP_visible = false
		1: monster_HP_visible = true
	save.get_8()
	
	if !smert_est:
		poisk_sim(save, 82, 0)   # R - 82
		razm = save.get_8() - 48
		N = mini_load(save, 3)
		M = mini_load(save, 3)
		save.get_8()
		for i in range(0, N):
			for I in range(0, razm):
				for j in range(0, M):
					pred_rooms[I][i][j] = mini_load(save, 5)
				if I != razm - 1:
					save.get_8()
				else:
					save.get_8()
		create_strust(2)
		#print(pred_monsters[0].size(), ' ', pred_monsters[1].size(), ' ', pred_monsters[2].size())
		for I in range(0, razm):
			for j in range(0, pred_monsters[I].size()):
				pred_monsters[I][j].type = mini_load(save, 3)
				pred_monsters[I][j].x = mini_load(save, 3)
				pred_monsters[I][j].y = mini_load(save, 3)
				pred_monsters[I][j].napr = mini_load(save, 3)
				#pred_monsters[I][j].printm()
				save.get_8()
			save.get_8()
			save.get_8()
		for I in range(0, razm):
			for j in range(0, 4):
				ch = mini_load(save, 4)
				if j%2 == 0:
					if ch == 1:
						pred_param[I][j] = true
					else:
						pred_param[I][j] = false
				else:
					pred_param[I][j] = ch
			save.get_8()
	print("Метаданные загружены.")
	
	poisk_sim(save, 68, nom_podz - 1)   # D - 68
	Z = mini_load(save, 3)
	K = mini_load(save, 3)
	L = mini_load(save, 3)
	N = mini_load(save, 3)
	M = mini_load(save, 3)
	#print(Z, K, L, N, M)
	save.get_8()
	create_strust(1)

	for z_dop in range(0, Z):
		for k_dop in range(0, K):
			for i in range(0, N):
				for m_dop in range(0, L):
					for j in range(0, M):
						Pole[z_dop][k_dop][m_dop][i][j] = mini_load(save, 5)
				save.get_8()
		print("Загружен этаж ", z_dop + 1, " подземелья ", nom_podz, ". Всего ", Z, " этажей(-а).")
		save.get_8()

	#print(Pole)
	poisk_sim(save, 84, 0)   # T - 84
	kol_mon = mini_load(save, 4)
	poisk_sim(save, 10, 1)   # \n - 13/10
	
	table.clear()
	var Monster = load("res://Monster.gd")
	for i in range(0, kol_mon):
		var one = Monster.new()
		table.append(one)
	
	for j in range(0, kol_mon):
		for i in range(0, 7):
			match i:
				0: table[j].type = mini_load(save, 3)
				1: table[j].x = mini_load(save, 3)
				2: table[j].y = mini_load(save, 3)
				3: table[j].m = mini_load(save, 3)
				4: table[j].k = mini_load(save, 3)
				5: table[j].z = mini_load(save, 3)
				6: table[j].napr = mini_load(save, 3)
		#print(table[j].type, ' ', table[j].x, ' ', table[j].y, ' ', table[j].m, ' ', table[j].k, ' ', table[j].z, ' ', table[j].napr)
		save.get_8()
	room_monsters(room_mass, monster_table)
	print("Данные о монстрах в подземелье загружены.\n")

	save.get_8()
	save.get_8()
	for z_dop in range(0, Z):
		for k_dop in range(0, K):
			for m_dop in range(0, L):
				isp_kl[z_dop][k_dop][m_dop] = mini_load(save, 3)
			save.get_8()
		save.get_8()
	
	monster_HPv()   # окончание загрузки
	
	if komn_bossa(0):
		$"Неизменная часть/Walls_verx".position = Vector2(-672, 242)
		$"Неизменная часть/Boss_room".position = Vector2(-3, -14)
	else:
		if $"Неизменная часть/Walls_verx".position.x == -672:
			$"Неизменная часть/Walls_verx".position = Vector2(317, 242)
			$"Неизменная часть/Boss_room".position = Vector2(-992, -14)
	if smert_est:
		$"Враги/Гигантская Королева Пауков/HP".text = str(20 * nom_podz)
	else:
		$"Враги/Гигантская Королева Пауков/HP".text = str(pred_param[0][1]/5)
	if boss_battle == 0:
		$"HP_boss_bar".visible = true
		$"HP_boss_bar".value = 5*int($"Враги/Гигантская Королева Пауков/HP".text)
		$"Местонахождение".visible = false
	else:
		$"HP_boss_bar".visible = false
		$"Местонахождение".visible = true
		$"Местонахождение".text = "Подземный дворец Святой Десятки. Этаж " + str(z + 1)
	
	save.close()
	return(Pole)
func fprintf(file, razm, perem):
	var kop = abs(perem)
	var i_zn = 0
	var chasti = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for i in range(0, razm):
		if abs(perem) >= step(10, razm - 1 - i):
			chasti[i] = kop/step(10, razm - 1 - i)
			kop -= chasti[i] * step(10, razm - 1 - i)
		else:
			chasti[i] = -1
		if i == razm - 1 && int(perem)%10 == 0:
			chasti[i] = 0
	
	if perem < 0:
		for i in range(0, razm):
			if chasti[i] < 0:
				i_zn = i
		chasti[i_zn] = 45
	
	for i in range(0, razm):
		if chasti[i] >= 0 && chasti[i] <= 9:
			file.store_8(chasti[i] + 48)
		else:
			if chasti[i] == 45:
				file.store_8(45)
			else:
				file.store_8(32)
func save_save():
	var c = 0
	var text = "1"
	var put_s = ""
	var put_b = ""
	var save = File.new()
	var backup = File.new()
	var kol_perv = 0
	
	save_room(room_mass, monster_table)
	
	put_s = "res://Текстовые файлы/save_slot_" + $"/root/VudrYachSoxr".text + ".txt"
	put_b = "res://Текстовые файлы/backup_" + $"/root/VudrYachSoxr".text + ".txt"
	save.open(put_s, File.READ)
	backup.open(put_b, File.WRITE)
	text = save.get_as_text()
	backup.store_string(text)
	save.close()
	backup.close()

	backup.open(put_b, File.READ)
	save.open(put_s, File.WRITE)
	save.store_string("**1" + $"/root/Slojnost".text + "0**")
	save.store_string("Количество пройденных подземелий, номер подземелья с игроком, количество сохранений, количество сердец, количество смертей, дары,\nx_pred, y_pred, boss_battle, phase_flag, dialog_phase, vub_flag, m, k, z, min_hero_sila, sch_10, monster_HP_visible\nS")
	
	# запасное место для метапеременных
	# запасное место для метапеременных
	fprintf(save, 3, kol_podz)
	fprintf(save, 3, nom_podz)
	for i_dop in range(0, 11):
		if i_dop == 0:
			save.store_8(32)
		else:
			save.store_8(44)
		fprintf(save, 2, kol_soxr[i_dop])
	for i_dop in range(0, 11):
		if i_dop == 0:
			save.store_8(32)
		else:
			save.store_8(44)
		fprintf(save, 2, kol_serd[i_dop])
	fprintf(save, 3, kol_sl_serd)
	for i_dop in range(0, 11):
		if i_dop == 0:
			save.store_8(32)
		else:
			save.store_8(44)
		fprintf(save, 2, kol_smert[i_dop])
	for i_dop in range(1, 11):
		var adr = "/root/Dari/Дар_" + str(i_dop)
		if i_dop == 1:
			save.store_8(32)
		else:
			save.store_8(44)
		fprintf(save, 2, int(get_node(adr).text))
	fprintf(save, 3, x_pred)
	fprintf(save, 3, y_pred)
	fprintf(save, 3, boss_battle)
	fprintf(save, 3, phase_flag)
	fprintf(save, 3, dialog_phase)
	#printf("%3d%3d%3d%3d%3d", x_pred, y_pred, boss_battle, phase_flag, dialog_phase);
	match vub_flag:
		false: fprintf(save, 3, 0)
		true: fprintf(save, 3, 1)
	fprintf(save, 3, m)
	fprintf(save, 3, k)
	fprintf(save, 3, z)
	fprintf(save, 3, min_hero_sila)
	fprintf(save, 3, sch_10)
	#printf("%3d%3d%3d%3d%3d", m, k, z, min_hero_sila, sch_10);
	match monster_HP_visible:
		false: fprintf(save, 3, 0)
		true: fprintf(save, 3, 1)
	save.store_8(10)
	
	save.store_8(82)   # R - 82
	fprintf(save, 1, pred_rooms.size())
	fprintf(save, 3, N)
	fprintf(save, 3, M)
	save.store_8(10)
	for i in range(0, N):
		for I in range(0, pred_rooms.size()):
			for j in range(0, M):
				fprintf(save, 5, pred_rooms[I][i][j])
			if I != pred_rooms.size() - 1:
				save.store_8(124)
			else:
				save.store_8(10)
	for I in range(0, pred_monsters.size()):
		for j in range(0, pred_monsters[I].size()):
			fprintf(save, 3, pred_monsters[I][j].type)
			fprintf(save, 3, pred_monsters[I][j].x)
			fprintf(save, 3, pred_monsters[I][j].y)
			fprintf(save, 3, pred_monsters[I][j].napr)
			save.store_8(10)
		save.store_8(45)
		save.store_8(10)
	for I in range(0, pred_param.size()):
		for j in range(0, 4):
			if j%2 == 0:
				if pred_param[I][j]:
					fprintf(save, 4, 1)
				else:
					fprintf(save, 4, 0)
			else:
				fprintf(save, 4, pred_param[I][j])
		save.store_8(10)
	print("\nМетаданные записаны.")
	
	
	save.store_8(10)
	save.store_8(68)   # D - 68
	poisk_sim(backup, 68, 0);
	for i_dop in range(0, kol_podz):
		if i_dop == nom_podz - 1:
			break
		else:
			while true:
				c = backup.get_8()
				if c != 68:
					save.store_8(c)
				else:
					break
			save.store_8(68)
	fprintf(save, 3, Z)
	fprintf(save, 3, K)
	fprintf(save, 3, L)
	fprintf(save, 3, N)
	fprintf(save, 3, M)
	save.store_8(10)   # \n - 2573/10

	for z_dop in range(0, Z):
		for k_dop in range(0, K):
			for i in range(0, N):
				for m_dop in range(0, L):
					for j in range(0, M):
						fprintf(save, 5, Pole[z_dop][k_dop][m_dop][i][j])
				save.store_8(10)
		save.store_8(10)

	save.store_8(10)
	save.store_string("T")   # T - 84
	fprintf(save, 4, monster_table.size())
	save.store_8(10)
	save.store_string("ch  x  y  m  k  z napr")
	save.store_8(10)
	for j in range(0, monster_table.size()):
		for i in range(0, 7):
			match i:
				0: fprintf(save, 3, monster_table[j].type)
				1: fprintf(save, 3, monster_table[j].x)
				2: fprintf(save, 3, monster_table[j].y)
				3: fprintf(save, 3, monster_table[j].m)
				4: fprintf(save, 3, monster_table[j].k)
				5: fprintf(save, 3, monster_table[j].z)
				6: fprintf(save, 3, monster_table[j].napr)
		save.store_8(10)
	print("Данные о монстрах в подземелье записаны.\n")

	
	save.store_string("K")
	save.store_8(10)
	for z_dop in range(0, Z):
		for k_dop in range(0, K):
			for m_dop in range(0, L):
				fprintf(save, 3, isp_kl[z_dop][k_dop][m_dop])
			save.store_8(10)   # \n - 2573/10
		save.store_8(10)
	if nom_podz < kol_podz:
		poisk_sim(backup, 68, 0)
		save.store_8(10)
		save.store_8(10)
		save.store_string("D")
		while true:
			c = backup.get_8()
			if c != 0:
				save.store_8(c)
			else:
				break
	
	save.close()
	backup.close()
	
	
	for i in range(1, 4):
		put_s = "res://Текстовые файлы/save_slot_" + str(i) + ".txt"
		if save.open(put_s, File.READ) == 0:
			save.get_16()
			if save.get_8() == 49:
				kol_perv += 1
	if kol_perv > 1:
		for i in range(1, 4):
			put_s = "res://Текстовые файлы/save_slot_" + str(i) + ".txt"
			if save.open(put_s, File.READ) == 0:
				backup.open("res://Текстовые файлы/dop.txt", File.WRITE)
				while true:
					c = save.get_8()
					if c != 0:
						backup.store_8(c)
					else:
						break
				backup.close()
				save.close()

				save.open(put_s, File.WRITE)
				backup.open("res://Текстовые файлы/dop.txt", File.READ)
				kol_perv = 0
				while true:
					c = backup.get_8()
					if c > 48 && c < 51 && i != int($"/root/VudrYachSoxr".text) && kol_perv == 2:
						save.store_8(c + 1)
						#print(c + 1)
					else:
						if c != 0:
							save.store_8(c)
						else:
							break
					kol_perv += 1
				backup.open("res://Текстовые файлы/dop.txt", File.WRITE)
				backup.close()
				save.close()

func create_strust(nom_struct):
	var Room_monster = load("res://Room_monster.gd")
	if nom_struct == 1:
		for z_l in range(0, Z):
			for k_l in range(0, K):
				for m_l in range(0, L):
					for i in range(0, N):
						for j in range(0, M):
							Pole[z_l][k_l][m_l][i].append(0)
	else:
		if nom_struct == 2:
			for i in range(0, 3):
				pred_monsters[i].clear()
			for i in range(0, 3):
				for j in range(0, 20):
					var one = Room_monster.new()
					pred_monsters[i].append(one)
func room_monsters(mass, table):
	var j_m = 0
	var enter_kol_sm = 0
	var Room_monster = load("res://Room_monster.gd")
	for j in range(0, table.size()):
		if table[j].type != 0 && table[j].z == z && table[j].k == k && table[j].m == m:
			enter_kol_sm += 1
	mass.clear()
	for j_b in range(0, enter_kol_sm):
		var one = Room_monster.new()
		mass.append(one)
	if enter_kol_sm > 0:
		for j in range(0, table.size()):
			if table[j].type != 0 && table[j].z == z && table[j].k == k && table[j].m == m:
				mass[j_m].type = table[j].type
				mass[j_m].x = table[j].x
				mass[j_m].y = table[j].y
				mass[j_m].napr = table[j].napr
				j_m += 1

func save_room(mass, table):
#	for j in range(0, table.size()):
#		print(table[j].type," ",table[j].x," ",table[j].y," ",table[j].napr)
#	print("\n\n")
	var j_r = 0
	for j_t in range(0, table.size()):
		if table[j_t].type != 0 && table[j_t].m == m && table[j_t].k == k && table[j_t].z == z:
			table[j_t].type = mass[j_r].type
			table[j_t].x = mass[j_r].x
			table[j_t].y = mass[j_r].y
			table[j_t].napr = mass[j_r].napr
			j_r += 1
func obnul_Pole(Pol, Z, K, L, N, M):
	for z_l in range(0, Z):
		for k_l in range(0, K):
			for m_l in range(0, L):
				for i in range(0, N):
					for j in range(0, M):
						Pol[z_l][k_l][m_l][i][j] = 0
	return Pol
func poisk_smerti(Pol):
	var kol_hero = 0
	var nom_podsk = 0
	for i in range(0,N):
		for j in range(0,M):
			if Pol[z][k][m][i][j] >= 1 && Pol[z][k][m][i][j] <= 9:
				kol_hero += 1
	if kol_hero == 0:
		$"Оповещение о смерти и сохранениях".modulate.a = 1
		$"Оповещение о смерти и сохранениях".visible = true
		$"Оповещение о смерти и сохранениях/Текст".text = "Вы умерли"
		
		$"Диалоговое окно".visible = false
		hod_lock = false
		var x10 = ($"Святая Десятка".position.x + 3 - 32)/64
		var y10 = ($"Святая Десятка".position.y + 14 - 32)/64
		for i in range(0, N):
			for j in range(0, M):
				if pred_rooms[0][i][j] == 10:
					if !(x10 == j && y10 == i):
						pred_rooms[0][i][j] = 0
		Pol = obnul_Pole(Pol, Z, K, L, N, M)
		load_save(Pol, monster_table, true)
		
		kol_smert[nom_podz - 1] += 1
		pred_hod(N, M)
		snat_vse()
		rasst(Pol[z][k][m], room_mass, 0)
		
		if kol_smert[nom_podz - 1]%(2 * int(sl.text) + 1) == 0:
			$"Подсказки".visible = true
			nom_podsk = (kol_smert[nom_podz - 1]/(2 * int(sl.text) + 1))%podsk.size()
			$"Подсказки/Нынешняя подсказка".text = podsk[nom_podsk - 1]
	else:
		kol_hero = 0
	return Pol
func hero_turn(Pol, N, M, z, k, m):
	var x = ($"OneHero".position.x + 3 - 32)/64
	var y = ($"OneHero".position.y + 14 - 32)/64
	var x_com = -2
	var y_com = -2
	var ne_kray = false
	var kod_pereh
	x_pred = x
	y_pred = y
	if Input.is_action_just_pressed("ui_right"):
		x_com = x + 1
		y_com = y
		ne_kray = (x + 1 != M)
		kod_pereh = 49
	else:
		if Input.is_action_just_pressed("ui_left"):
			x_com = x - 1
			y_com = y
			ne_kray = (x - 1 != -1)
			kod_pereh = 69
		else:
			if Input.is_action_just_pressed("ui_down"):
				x_com = x
				y_com = y + 1
				ne_kray = (y + 1 != N)
				kod_pereh = 59
			else:
				if Input.is_action_just_pressed("ui_up"):
					x_com = x
					y_com = y - 1
					ne_kray = (y - 1 != -1)
					kod_pereh = 39
	if isp_1sp == false:
		if x_com != -2 && y_com != -2:
			if ne_kray:
				if Pol[z][k][m][y_com][x_com] != 100 && Pol[z][k][m][y_com][x_com] != 30:
					match Pol[z][k][m][y_com][x_com]:
						109: Pol[z][k][m][y_com][x_com] = 1
						29:
							Pol[z][k][m][y_com][x_com] = 1
							kol_serd[nom_podz - 1] += 1
							serd_est = true
					if Pol[z][k][m][y_com][x_com] != 10*nom_podz:
						Pol[z][k][m][y_com][x_com] += Pol[z][k][m][y][x]
						Pol[z][k][m][y][x] = 0
					else:
						vz_10()
			else:
				Pol[z][k][m][y][x] += kod_pereh
	else:
		if ne_kray:
			if Pole[z][k][m][y_com][x_com] == 0:
				Pole[z][k][m][y_com][x_com] += 109
				sch_10 = 5
				isp_kl[z][k][m] -= 1
				$"Оповещения о сердцах".visible = true
				$"Оповещения о сердцах/Сообщение".text = "В этой комнате можно создать\nещё " + str(isp_kl[z][k][m]) + " клона(-ов)."
			else:
				prop_hod_vr = true
				$"Оповещения о сердцах".visible = true
				$"Оповещения о сердцах/Сообщение".text = "Место, куда Вы хотите\nпоставить клона чем-то занято."
			isp_1sp = false
		else:
			prop_hod_vr = true
			$"Оповещения о сердцах".visible = true
			$"Оповещения о сердцах/Сообщение".text = "Вы можете поставить клона\nтолько в той комнате,\nв которой находитесь."
	
	if Input.is_action_just_pressed("1sp") && int(dari_1.text) == 1:
		isp_1sp = true
	if serd_est:
		$"Оповещения о сердцах/Сообщение".text = "Вы нашли кристаллическое сердце,\nи его позитивная энергия наполняет\nВас. Ваше временное здоровье\nувеличилось на 1."
		$"Оповещения о сердцах".visible = true
	return Pol
func pluh(N, M):
	var x = -1
	var y = -1
	for i in range(0, N):
		for j in range(0, M):
			if Pole[z][k][m][i][j] >= 3 && Pole[z][k][m][i][j] <= 9:
				x = j
				y = i
				break
	if x > -1 && x < M:
		if y > -1 && y < N:
			for i in range(0, N):
				for j in range(0, M):
					var usl1 = i >= y - 1 && i <= y + 1
					var usl2 = j >= x - 1 && j <= x + 1
					if usl1 && usl2:
						if Pole[z][k][m][i][j] < 0:
							Pole[z][k][m][i][j] += 1
func hod_vr(room_mass, N, M):
	#	for j in range(0, room_mass.size()):
#		print(room_mass[j].type," ",room_mass[j].x," ",room_mass[j].y," ",room_mass[j].napr)
#	print("\n\n")
	for j_vr in range(0,room_mass.size()):
		if room_mass[j_vr].type == 0:
			continue
		if Pole[z][k][m][room_mass[j_vr].y][room_mass[j_vr].x] >= 0:
			room_mass[j_vr].obnul()
			continue
		match room_mass[j_vr].type:
			2:hod_2(room_mass[j_vr], 1)
			3:hod_3(room_mass[j_vr], 1)
			5:hod_5(room_mass[j_vr], M, N)
			7:hod_2(room_mass[j_vr], 2)
			8:hod_3(room_mass[j_vr], 2)
			9:hod_5(room_mass[j_vr], M, N)
		sliyanie()
		raspad(N, M)
func hod_2(monster, dey):
	var x_vr = monster.x
	var y_vr = monster.y
	var napr_vr = monster.napr
	var r_vr = 0
	while r_vr < 2:
		if dey >= 1 && napr_vr == 86:   #V
			if Pole[z][k][m][y_vr - 1][x_vr] <= 18 && y_vr != 0:
				Pole[z][k][m][y_vr - 1][x_vr] = Pole[z][k][m][y_vr][x_vr] + Pole[z][k][m][y_vr - 1][x_vr]
				Pole[z][k][m][y_vr][x_vr] = 0
				y_vr -= 1
				dey -= 1
			else:
				napr_vr = 78
		else:
			if dey >= 1 && napr_vr == 78:   #N
				if Pole[z][k][m][y_vr + 1][x_vr] <= 18 && y_vr != N - 1:
					Pole[z][k][m][y_vr + 1][x_vr] = Pole[z][k][m][y_vr][x_vr] + Pole[z][k][m][y_vr + 1][x_vr]
					Pole[z][k][m][y_vr][x_vr] = 0
					y_vr += 1
					dey -= 1
				else:
					napr_vr = 86
		r_vr += 1
	monster.x = x_vr
	monster.y = y_vr
	monster.napr = napr_vr
func hod_3(monster, dey):
	var x_vr = monster.x
	var y_vr = monster.y
	var napr_vr = monster.napr
	var r_vr = 0
	while r_vr < 2:
		if dey >= 1 && napr_vr == 80:   #P
			if Pole[z][k][m][y_vr][x_vr + 1] <= 18 && x_vr != M - 1:
				Pole[z][k][m][y_vr][x_vr + 1] = Pole[z][k][m][y_vr][x_vr + 1] + Pole[z][k][m][y_vr][x_vr]
				Pole[z][k][m][y_vr][x_vr] = 0
				x_vr += 1
				dey -= 1
			else:
				napr_vr = 76
		else:
			if dey >= 1 && napr_vr == 76:   #L
				if Pole[z][k][m][y_vr][x_vr - 1] <= 18 && x_vr != 0:
					Pole[z][k][m][y_vr][x_vr - 1] = Pole[z][k][m][y_vr][x_vr - 1] + Pole[z][k][m][y_vr][x_vr]
					Pole[z][k][m][y_vr][x_vr] = 0
					x_vr -= 1
					dey -= 1
				else:
					napr_vr = 80
		r_vr += 1
	monster.x = x_vr
	monster.y = y_vr
	monster.napr = napr_vr
func hod_5(monster, N, M):
	var x_vr = monster.x
	var y_vr = monster.y
	var napr_vr = monster.napr
	
	var rnd = RandomNumberGenerator.new()
	rnd.randomize()
	
	var r_vr = 0
	var dey  = 1
	# V - 86   N - 78   P - 80   L - 76
	var x_hero = ($"OneHero".position.x + 3 - 32)/64
	var y_hero = ($"OneHero".position.y + 14 - 32)/64
	if x_hero < 1 || x_hero > M - 2 || y_hero < 1 || y_hero > N - 2:
		x_hero = 2
		y_hero = 2
	var X = abs(x_vr - x_hero)
	var Y = abs(y_vr - y_hero)
	
	
	if X > Y:
		if x_vr > x_hero:
			napr_vr = 76
		else:
			napr_vr = 80
	else:
		if Y > X:
			if y_vr > y_hero:
				napr_vr = 86
			else:
				napr_vr = 78
		else:
			if X == Y:
				if rnd.randi()%2 == 0:
					if x_vr > x_hero:
						napr_vr = 76
					else:
						napr_vr = 80
				else:
					if y_vr > y_hero:
						napr_vr = 86
					else:
						napr_vr = 78
	while r_vr < 2:  # V - 86   N - 78   P - 80   L - 76
		if napr_vr == 76 && dey == 1:
			if Pole[z][k][m][y_vr][x_vr - 1] <= 18:
				Pole[z][k][m][y_vr][x_vr - 1] = Pole[z][k][m][y_vr][x_vr - 1] + Pole[z][k][m][y_vr][x_vr]
				Pole[z][k][m][y_vr][x_vr] = 0
				x_vr -= 1
				dey -= 1
			else:
				if y_vr > y_hero:
					napr_vr = 86
				else:
					napr_vr = 78
		else:
			if napr_vr == 80 && dey == 1:
				if Pole[z][k][m][y_vr][x_vr + 1] <= 18:
					Pole[z][k][m][y_vr][x_vr + 1] = Pole[z][k][m][y_vr][x_vr + 1] + Pole[z][k][m][y_vr][x_vr]
					Pole[z][k][m][y_vr][x_vr] = 0
					x_vr += 1
					dey -= 1
				else:
					if y_vr > y_hero:
						napr_vr = 86
					else:
						napr_vr = 78
			else:
				if napr_vr == 86 && dey == 1:
					if Pole[z][k][m][y_vr - 1][x_vr] <= 18:
						Pole[z][k][m][y_vr - 1][x_vr] = Pole[z][k][m][y_vr][x_vr] + Pole[z][k][m][y_vr - 1][x_vr]
						Pole[z][k][m][y_vr][x_vr] = 0
						y_vr -= 1
						dey -= 1
					else:
						if x_vr > x_hero:
							napr_vr = 76
						else:
							napr_vr = 80
				else:
					if napr_vr == 78 && dey == 1:
						if Pole[z][k][m][y_vr + 1][x_vr] <= 18:
							Pole[z][k][m][y_vr + 1][x_vr] = Pole[z][k][m][y_vr][x_vr] + Pole[z][k][m][y_vr + 1][x_vr]
							Pole[z][k][m][y_vr][x_vr] = 0
							y_vr += 1
							dey -= 1
						else:
							if x_vr > x_hero:
								napr_vr = 76
							else:
								napr_vr = 80
		r_vr += 1
	monster.x = x_vr
	monster.y = y_vr
	monster.napr = napr_vr
func boss_10(N, M):
	var HP_10 = int($"Враги/Гигантская Королева Пауков/HP".text)
	var x = 0
	var y = 0
	for i in range(0,N):
		for j in range(0,M):
			if Pole[z][k][m][i][j] >= 1 && Pole[z][k][m][i][j] <= 9:
				x = j
				y = i
	var X = 0
	var Y = 0
	if boss_battle == -1 && z == 2 && m == 0 && k == 0 && Pole[z][k][m][7][4] == 0 && Pole[z][k][m][8][4] == 0:
		Pole[z][k][m][7][4] = 100
		monolog_GQoS(1)
		boss_battle = 0
		phase_flag = 0
		if Pole[z][k][m][7][3] == 0:
			Pole[z][k][m][7][3] = 100
		if Pole[z][k][m][7][5] == 0:
			Pole[z][k][m][7][5] = 100
		$"Местонахождение".visible = false
		$"HP_boss_bar".visible = true
	else:
		if boss_battle == 0:
			x_10 = ($"Враги/Гигантская Королева Пауков".position.x + 3 - 32)/64
			y_10 = ($"Враги/Гигантская Королева Пауков".position.y + 14 - 32)/64
			while Pole[z][k][m][y_10][x_10] >= -9:
				HP_10 -= 1
				Pole[z][k][m][y_10][x_10] -= 1
			if HP_10 <= 0:
				boss_battle = 1
				Pole[z][k][m][y_10][x_10] = -HP_10
				monolog_GQoS(4)
				dialog_phase += 1
				$"HP_boss_bar".visible = false
				$"Местонахождение".visible = true
			else:
				X = x_10 - x
				Y = y_10 - y
				if X < 0:
					X = -X
				if Y < 0:
					Y = -Y
				if HP_10 > 15:
					presl_10(X, Y, x, y)
				else:
					if HP_10 > 10 && HP_10 <= 15:
						if phase_flag == 0:
							monolog_GQoS(2)
							phase_flag += 1
						else:
							if X + Y <= 1:
								presl_10(X, Y, x, y)
							else:
								Pole[z][k][m][y_pred][x_pred] += Pole[z][k][m][y_10][x_10]
								Pole[z][k][m][y_10][x_10] = 0
					else:
						if HP_10 > 0 && HP_10 <= 10:
							if phase_flag == 1:
								monolog_GQoS(3)
								phase_flag += 1
							else:
								if X + Y == 1:
									presl_10(X, Y, x, y)
								else:
									if y == y_pred - 1 && Pole[z][k][m][y - 1][x] <= 18:
										Pole[z][k][m][y - 1][x] += Pole[z][k][m][y_10][x_10]
										Pole[z][k][m][y_10][x_10] = 0
									else:
										if x == x_pred + 1 && Pole[z][k][m][y][x + 1] <= 18:
											Pole[z][k][m][y][x + 1] += Pole[z][k][m][y_10][x_10]
											Pole[z][k][m][y_10][x_10] = 0
										else:
											if y == y_pred + 1 && Pole[z][k][m][y + 1][x] <= 18:
												Pole[z][k][m][y + 1][x] += Pole[z][k][m][y_10][x_10]
												Pole[z][k][m][y_10][x_10] = 0
											else:
												if x == x_pred - 1 && Pole[z][k][m][y][x - 1] <= 18:
													Pole[z][k][m][y][x - 1] += Pole[z][k][m][y_10][x_10]
													Pole[z][k][m][y_10][x_10] = 0
												else:
													Pole[z][k][m][y_pred][x_pred] += Pole[z][k][m][y_10][x_10]
													Pole[z][k][m][y_10][x_10] = 0
		else:
			if boss_battle == 1:
				boss_battle += 1
				if Pole[z][k][m][y_10][x_10] == 0:
					Pole[z][k][m][y_10][x_10] = 10
				else:
					if Pole[z][k][m][y_10][x_10 + 1] == 0:
						Pole[z][k][m][y_10][x_10 + 1] = 10
					else:
						if Pole[z][k][m][y_10][x_10 - 1] == 0:
							Pole[z][k][m][y_10][x_10 - 1] = 10
						else:
							if Pole[z][k][m][y_10 + 1][x_10] == 0:
								Pole[z][k][m][y_10 + 1][x_10] = 10
							else:
								if Pole[z][k][m][y_10 - 1][x_10] == 0:
									Pole[z][k][m][y_10 - 1][x_10] = 10
				Pole[z][k][m][4][4] = 0
				monolog_GQoS(5)
	for i in range(0, N):
		for j in range(0, M):
			if Pole[2][0][0][i][j] < 0:
				while Pole[2][0][0][i][j] > -10:
					HP_10 -= 1
					Pole[z][k][m][i][j] -= 1
	if HP_10 > 0 && boss_battle == 0:
		$"HP_boss_bar".value = HP_10 * 5
	$"Враги/Гигантская Королева Пауков/HP".text = str(HP_10)
func komn_bossa(nom_pred):
	if nom_pred == 0:
		return(z == 2 && k == 0 && m == 0)
	else:
		return(pred_param[nom_pred][0])
func presl_10(X, Y, x_hero, y_hero):
	var dey = 1
	var r_vr = 0
	var napr_vr = 0 # V - 86   N - 78   P - 80   L - 76
	var rnd = RandomNumberGenerator.new()
	rnd.randomize()
	
	X = abs(X)
	Y = abs(Y)
	if X > Y:
		if x_10 > x_hero:
			napr_vr = 76
		else:
			napr_vr = 80
	else:
		if Y > X:
			if y_10 > y_hero:
				napr_vr = 86
			else:
				napr_vr = 78
		else:
			if X == Y:
				if rnd.randi()%2 == 0:
					if x_10 > x_hero:
						napr_vr = 76
					else:
						napr_vr = 80
				else:
					if y_10 > y_hero:
						napr_vr = 86
					else:
						napr_vr = 78
	while r_vr < 2:  # V - 86   N - 78   P - 80   L - 76
		if napr_vr == 76 && dey == 1:
			if Pole[z][k][m][y_10][x_10 - 1] <= 18:
				Pole[z][k][m][y_10][x_10 - 1] = Pole[z][k][m][y_10][x_10 - 1] + Pole[z][k][m][y_10][x_10]
				Pole[z][k][m][y_10][x_10] = 0
				x_10 -= 1
				dey -= 1
			else:
				if y_10 > y_hero:
					napr_vr = 86
				else:
					napr_vr = 78
		else:
			if napr_vr == 80 && dey == 1:
				if Pole[z][k][m][y_10][x_10 + 1] <= 18:
					Pole[z][k][m][y_10][x_10 + 1] = Pole[z][k][m][y_10][x_10 + 1] + Pole[z][k][m][y_10][x_10]
					Pole[z][k][m][y_10][x_10] = 0
					x_10 += 1
					dey -= 1
				else:
					if y_10 > y_hero:
						napr_vr = 86
					else:
						napr_vr = 78
			else:
				if napr_vr == 86 && dey == 1:
					if Pole[z][k][m][y_10 - 1][x_10] <= 18:
						Pole[z][k][m][y_10 - 1][x_10] = Pole[z][k][m][y_10][x_10] + Pole[z][k][m][y_10 - 1][x_10]
						Pole[z][k][m][y_10][x_10] = 0
						y_10 -= 1
						dey -= 1
					else:
						if x_10 > x_hero:
							napr_vr = 76
						else:
							napr_vr = 80
				else:
					if napr_vr == 78 && dey == 1:
						if Pole[z][k][m][y_10 + 1][x_10] <= 18:
							Pole[z][k][m][y_10 + 1][x_10] = Pole[z][k][m][y_10][x_10] + Pole[z][k][m][y_10 + 1][x_10]
							Pole[z][k][m][y_10][x_10] = 0
							y_10 += 1
							dey -= 1
						else:
							if x_10 > x_hero:
								napr_vr = 76
							else:
								napr_vr = 80
		r_vr += 1
func vz_10():
	hod_lock = true
	$"Диалоговое окно".visible = true
	if dialog_phase == 0:
		dialog_10(0)
func sliyanie():
	var kopiya = 0
	var sliyanie_bulo = false
	for j_t_start in range(0, room_mass.size()):
		for j_t in range(j_t_start + 1, room_mass.size()):
			if (room_mass[j_t].x == room_mass[j_t_start].x) && (room_mass[j_t].y == room_mass[j_t_start].y) && room_mass[j_t_start].type:
				kopiya = Pole[z][k][m][room_mass[j_t].y][room_mass[j_t].x]
				if kopiya >= -9 && kopiya < 0:
					match -kopiya:
						1:room_mass[j_t_start].type = 1
						2:
							room_mass[j_t_start].type = 2
							room_mass[j_t_start].napr = 86
						3:
							room_mass[j_t_start].type = 3
							room_mass[j_t_start].napr = 80
						4:room_mass[j_t_start].type = 5
						5:room_mass[j_t_start].type = 5
						6:room_mass[j_t_start].type = 5
						7:
							room_mass[j_t_start].type = 7
							room_mass[j_t_start].napr = 86
						8:
							room_mass[j_t_start].type = 8
							room_mass[j_t_start].napr = 80
						9:room_mass[j_t_start].type = 9
						_:room_mass[j_t_start].type = 1
					room_mass[j_t].obnul()
					sliyanie_bulo = true
					break
		if sliyanie_bulo:
			break
func raspad(N, M):
	for j_t in range(0, room_mass.size()):
		if Pole[z][k][m][room_mass[j_t].y][room_mass[j_t].x] <= -10 && !(z == 2 && k == 0 && m == 0):
			for i in range(0, N):
				for j in range(0, M):
					if Pole[z][k][m][i][j] <= 0 && j >= room_mass[j_t].x - 1 && j <= room_mass[j_t].x + 1 && i >= room_mass[j_t].y - 1 && i <= room_mass[j_t].y + 1:
						Pole[z][k][m][i][j] -= 1
						Pole[z][k][m][room_mass[j_t].y][room_mass[j_t].x] += 1
			room_mass[j_t].type = -Pole[z][k][m][room_mass[j_t].y][room_mass[j_t].x]
			match room_mass[j_t].type:
				2:room_mass[j_t].napr = 86
				3:room_mass[j_t].napr = 80
				4:room_mass[j_t].type = 5
				6:room_mass[j_t].type = 5
				7:room_mass[j_t].napr = 86
				8:room_mass[j_t].napr = 80
				9:room_mass[j_t].type = 9
func perehod(Pol, N_m, M_m, mass, table):
	for i in range(0, N_m):
		for j in range(0, M_m):
			if Pol[z][k][m][i][j] >= 40 && Pol[z][k][m][i][j] <= 48:
				Pol[z][k - 1][m][N_m - 1][j] += Pol[z][k][m][i][j] - 39
				Pol[z][k][m][i][j] = 0
				save_room(mass, table)
				k -= 1
				room_monsters(mass, table)
			else:
				if Pol[z][k][m][i][j] >= 50 && Pol[z][k][m][i][j] <= 58:
					Pol[z][k][m + 1][i][0] += Pol[z][k][m][i][j] - 49
					Pol[z][k][m][i][j] = 0
					save_room(mass, table)
					m +=1
					room_monsters(mass, table)
				else:
					if Pol[z][k][m][i][j] >= 60 && Pol[z][k][m][i][j] <= 68:
						Pol[z][k + 1][m][0][j] += Pol[z][k][m][i][j] - 59
						Pol[z][k][m][i][j] = 0
						save_room(mass, table)
						k += 1
						room_monsters(mass, table)
					else:
						if Pol[z][k][m][i][j] >= 70 && Pol[z][k][m][i][j] <= 78:
							Pol[z][k][m - 1][i][M_m - 1] += Pol[z][k][m][i][j] - 69
							Pol[z][k][m][i][j] = 0
							save_room(mass, table)
							m -= 1
							room_monsters(mass, table)
						else:
							if Pol[z][k][m][i][j] >= 20 && Pol[z][k][m][i][j] <= 28:
								Pol[z - 1][k][m][i - 1][j] += Pol[z][k][m][i][j] - 19
								Pol[z][k][m][i][j] = 19
								save_room(mass, table)
								z -= 1
								$"Местонахождение".text = "Подземный дворец Святой Десятки. Этаж " + str(z + 1)
								room_monsters(mass, table)
							else:
								if Pol[z][k][m][i][j] >= 80 && Pol[z][k][m][i][j] <= 88:
									Pol[z + 1][k][m][i - 1][j] += Pol[z][k][m][i][j] - 79
									Pol[z][k][m][i][j] = 79
									save_room(mass, table)
									z += 1
									$"Местонахождение".text = "Подземный дворец Святой Десятки. Этаж " + str(z + 1)
									room_monsters(mass, table)
	if komn_bossa(0):
		$"Неизменная часть/Walls_verx".position = Vector2(-672, 242)
		$"Неизменная часть/Boss_room".position = Vector2(-3, -14)
	else:
		if $"Неизменная часть/Walls_verx".position.x == -672:
			$"Неизменная часть/Walls_verx".position = Vector2(317, 242)
			$"Неизменная часть/Boss_room".position = Vector2(-992, -14)
	return Pol
func razr_serd(N, M, z_d):
	for z_i in z_d:
		if z_i == z:
			for i in range(0, N):
				for j in range(0, M):
					if Pole[z][k][m][i][j] == 29 && kol_sl_serd < (int(sl.text) - 1) * 2:
						Pole[z][k][m][i][j] = 30
						kol_sl_serd += 1
func vosst_serd(N, M, z_d):
	for z_i in z_d:
		if z_i == z:
			for i in range(0, N):
				for j in range(0, M):
					if Pole[z][k][m][i][j] == 30 && kol_sl_serd > (int(sl.text) - 1) * 2:
						Pole[z][k][m][i][j] = 29
						kol_sl_serd -= 1

func monolog_GQoS(fraze):
	hod_lock = true
	$"Диалоговое окно".visible = true
	if fraze == 1:
		sl_text.clear()
		sl_text.append("При этих словах Вам показалось, что через один из камней увидели гигантского паука с искаженным лицом Святой Десятки.")
		$"Диалоговое окно/Текст".text = "Ооо... У меня новый посетитель... Так еще и воин света. Ммм... Ну, что ж, давай поиграем."
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "???"
	if fraze == 2:
		sl_text.clear()
		$"Диалоговое окно/Текст".text = "Что ж, а ты не так слаб, как я думала... Так даже интереснее."
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = false
		$"Диалоговое окно/Говорящий/ГКП".visible = true
	if fraze == 3:
		sl_text.clear()
		$"Диалоговое окно/Текст".text = " ... Игры кончены! Пришло время твоего падения!"
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = false
		$"Диалоговое окно/Говорящий/ГКП".visible = true
	if fraze == 4:
		sl_text.clear()
		$"Диалоговое окно/Текст".text = "После последнего вашего удара гигантский паук падает на пол.\n*Гигантская Королева Пауков побеждена!*"
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = false
	if fraze == 5:
		sl_text.clear()
		$"Диалоговое окно/Текст".text = "Неожиданно для вас рядом c трупом Гигантской Королевы Пауков появляется существо, похожее на Святую Десятку. Также исчезает один из камней."
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = false
func dialog_10(dialog_phase):
	var i = 0
	var i_pred = 0
	if dialog_phase == 0:
		$"Диалоговое окно/Текст".text = $"Диалоговые сообщения/Текст зазы 0".text
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "2"
		$"Диалоговое окно/vubor_2".visible = true
		$"Диалоговое окно/vubor_2/Текст".text = "1"
		$"Диалоговое окно/vubor_3".visible = true
		$"Диалоговое окно/vubor_3/Текст".text = "3"
		
		$"Диалоговое окно/Говорящий".visible = false
	if dialog_phase == 1:
		sl_text.clear()
		var ves_text = $"Диалоговые сообщения/Текст зазы 1".text
		i = 0
		while i < ves_text.split('\n').size():
			sl_text.append(ves_text.split('\n')[i])
			i += 1
		$"Диалоговое окно/Текст".text = sl_text[0]
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Вы"
	if dialog_phase == 2:
		sl_text.clear()
		$"Диалоговое окно/Текст".text = "У тебя есть вопросы?"
		
		$"Диалоговое окно/vubor_2".visible = true
		$"Диалоговое окно/vubor_2/Текст".text = "Есть. Что произошло\nс Цифроградом?"
		$"Диалоговое окно/vubor_3".visible = true
		$"Диалоговое окно/vubor_3/Текст".text = "Нет."
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 3:
		sl_text.clear()
		$"Диалоговое окно/Текст".text = "Тогда помоги мне выбраться отсюда и исцелить остальных правителей Цифрограда."
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Могу только вывести\nВас отсюда."
		$"Диалоговое окно/vubor_2".visible = true
		$"Диалоговое окно/vubor_2/Текст".text = "Я готов\nпомочь."
		$"Диалоговое окно/vubor_2".rect_position.x = 2
		$"Диалоговое окно/vubor_3".visible = true
		$"Диалоговое окно/vubor_3/Текст".text = "Я не могу\nпомочь."
		$"Диалоговое окно/vubor_3".rect_position.x = 394
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 4:
		sl_text.clear()
		var ves_text = $"Диалоговые сообщения/Текст зазы 4".text
		i = 0
		while i < ves_text.split('\n').size():
			sl_text.append(ves_text.split('\n')[i])
			i += 1
		$"Диалоговое окно/Текст".text = sl_text[0]
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 5:
		sl_text.clear()
		var ves_text = $"Диалоговые сообщения/Текст зазы 5".text
		i = 0
		while i < ves_text.split('\n').size():
			sl_text.append(ves_text.split('\n')[i])
			i += 1
		$"Диалоговое окно/Текст".text = sl_text[0]
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 6:
		sl_text.clear()
		var ves_text = $"Диалоговые сообщения/Текст зазы 6".text
		i = 0
		while i < ves_text.split('\n').size():
			sl_text.append(ves_text.split('\n')[i])
			i += 1
		$"Диалоговое окно/Текст".text = sl_text[0]
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 7:
		sl_text.clear()
		var ves_text = $"Диалоговые сообщения/Текст зазы 7".text
		i = 0
		while i < ves_text.split('\n').size():
			sl_text.append(ves_text.split('\n')[i])
			i += 1
		$"Диалоговое окно/Текст".text = sl_text[0]
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 8:
		sl_text.clear()
		var ves_text = $"Диалоговые сообщения/Текст зазы 8".text
		i = 0
		while i < ves_text.split('\n').size():
			sl_text.append(ves_text.split('\n')[i])
			i += 1
		$"Диалоговое окно/Текст".text = sl_text[0]
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_2".rect_position.x = 100
		$"Диалоговое окно/vubor_3".visible = false
		$"Диалоговое окно/vubor_3".rect_position.x = 296
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 9:
		sl_text.clear()
		var ves_text = $"Диалоговые сообщения/Текст зазы 9".text
		i = 0
		while i < ves_text.split('\n').size():
			sl_text.append(ves_text.split('\n')[i])
			i += 1
		$"Диалоговое окно/Текст".text = sl_text[0]
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
	if dialog_phase == 10:
		sl_text.clear()
		$"Диалоговое окно/Текст".text = "Жаль."
		
		$"Диалоговое окно/vubor_1".visible = true
		$"Диалоговое окно/vubor_1/Текст".text = "Далее"
		$"Диалоговое окно/vubor_2".visible = false
		$"Диалоговое окно/vubor_3".visible = false
		
		$"Диалоговое окно/Говорящий".visible = true
		$"Диалоговое окно/Говорящий/Текст".visible = true
		$"Диалоговое окно/Говорящий/ГКП".visible = false
		$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
func _on_vubor_1_pressed():
	var N = 9
	var M = 9
	if $"Диалоговое окно/vubor_1/Текст".text == "Далее":
		if dialog_phase == -1 || dialog_phase == 0:
			if sl_text.size() == 0:
				hod_lock = false
				$"Диалоговое окно".visible = false
				if phase_flag == 0:
					save_save()
					$"Оповещение о смерти и сохранениях/Текст".text = "Игра сохранена"
					$"Оповещение о смерти и сохранениях".modulate.a = 1
					$"Оповещение о смерти и сохранениях".visible = true
			else:
				$"Диалоговое окно/Текст".text = sl_text[0]
				sl_text.remove(0)
				if boss_battle == 0:
					$"Диалоговое окно/Говорящий".visible = false
		match dialog_phase:
			1:
				var nom = sl_text.find($"Диалоговое окно/Текст".text)
				if nom == sl_text.size() - 2:
					$"Диалоговое окно/vubor_1".visible = false
					$"Диалоговое окно/vubor_2".visible = true
					$"Диалоговое окно/vubor_2/Текст".text = "Ваш\nспаситель."
					$"Диалоговое окно/vubor_2".rect_position.x = 100
					$"Диалоговое окно/vubor_3".visible = true
					$"Диалоговое окно/vubor_3/Текст".text = "Случайный\nпрохожий."
					$"Диалоговое окно/vubor_3".rect_position.x = 296
					$"Задания".visible = false
				if nom != sl_text.size() - 1:
					nom += 1
					$"Диалоговое окно/Текст".text = sl_text[nom]
					match nom + 1:
						1: 
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Вы"
						2: 
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
			4:
				var nom = sl_text.find($"Диалоговое окно/Текст".text)
				if nom == sl_text.size() - 2:
					$"Диалоговое окно/vubor_1".visible = false
					$"Диалоговое окно/vubor_2".visible = true
					$"Диалоговое окно/vubor_2/Текст".text = "Есть просьба."
					$"Диалоговое окно/vubor_3".visible = true
					$"Диалоговое окно/vubor_3/Текст".text = "Нет."
				if nom != sl_text.size() - 1:
					nom += 1
					$"Диалоговое окно/Текст".text = sl_text[nom]
					match nom + 1:
						2: 
							$"Диалоговое окно/Говорящий".visible = false
						3: 
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
			5:
				var nom = sl_text.find($"Диалоговое окно/Текст".text)
				if nom == sl_text.size() - 2:
					$"Диалоговое окно/vubor_1".visible = false
					$"Диалоговое окно/vubor_2".visible = true
					$"Диалоговое окно/vubor_2/Текст".text = "Кого?"
					$"Диалоговое окно/vubor_3".visible = true
					$"Диалоговое окно/vubor_3/Текст".text = "Согласен."
				if nom != sl_text.size() - 1:
					nom += 1
					$"Диалоговое окно/Текст".text = sl_text[nom]
					match nom + 1:
						2: 
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Вы"
						3:$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
						4:$"Диалоговое окно/Говорящий/Текст".text = "Вы"
						5:$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
						6:$"Диалоговое окно/Говорящий/Текст".text = "Вы"
						7:$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
						8:$"Диалоговое окно/Говорящий/Текст".text = "Вы"
						9:$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
			6:
				var nom = sl_text.find($"Диалоговое окно/Текст".text)
				if nom == sl_text.size() - 1:
					dialog_10(7)
					dialog_phase = 7
				else:
					nom += 1
					$"Диалоговое окно/Текст".text = sl_text[nom]
					match nom + 1:
						2: 
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Вы"
						3:$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
						4:$"Диалоговое окно/Говорящий/Текст".text = "Вы"
			7:
				var nom = sl_text.find($"Диалоговое окно/Текст".text)
				if nom == sl_text.size() - 1:
					hod_lock = false
					$"Диалоговое окно".visible = false
					Pole[z][k][m][0][4] = 0
					$"Неизменная часть/Boss_room/Закрытый проход".position.y -= 256
					dari_1.text = str(1)
					sch_10 = 5
				if nom != sl_text.size() - 1:
					nom += 1
					$"Диалоговое окно/Текст".text = sl_text[nom]
					match nom + 1:
						2:$"Диалоговое окно/Говорящий".visible = false
						3:
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
			8:
				var nom = sl_text.find($"Диалоговое окно/Текст".text)
				if nom == sl_text.size() - 2:
					$"Диалоговое окно/vubor_1".visible = false
					$"Диалоговое окно/vubor_2".visible = true
					$"Диалоговое окно/vubor_2/Текст".text = "Да."
					$"Диалоговое окно/vubor_3".visible = true
					$"Диалоговое окно/vubor_3/Текст".text = "Нет."
				if nom != sl_text.size() - 1:
					nom += 1
					$"Диалоговое окно/Текст".text = sl_text[nom]
					match nom + 1:
						2:
							$"Тьма".z_index = 3
							$"Диалоговое окно/Говорящий".visible = false
						3:
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
			9:
				var nom = sl_text.find($"Диалоговое окно/Текст".text)
				if nom == sl_text.size() - 1:
					hod_lock = false
					$"Диалоговое окно".visible = false
				if nom != sl_text.size() - 1:
					nom += 1
					$"Диалоговое окно/Текст".text = sl_text[nom]
					match nom + 1:
						2:
							$"Диалоговое окно/Говорящий".visible = true
							$"Диалоговое окно/Говорящий/Текст".visible = true
							$"Диалоговое окно/Говорящий/Текст".text = "Вы"
						3:
							$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
							$"Неизменная часть/Boss_room/Закрытый проход".position.y -= 256
							Pole[z][k][m][0][4] = 0
						4:$"Диалоговое окно/Говорящий".visible = false
			10:
				$"Диалоговое окно".visible = false
				game_end()
	if $"Диалоговое окно/vubor_1/Текст".text == "2":
		if dialog_phase == 0:
			$"Диалоговое окно/Текст".text = "После ващего удара существо рассыпается, и, неожиданно для Вас, его энергия втянулось в ваше тело. Вас посетила мысль, что это был не мимик...\n*Ваша минимальная сила повышена. Теперь при выходе из подземелья ваша сила будет понижаться не до единицы, а до двух.*"
			$"Задания".visible = false
			for i in range(0, N):
				for j in range(0, M):
					if Pole[z][k][m][i][j] == 10:
						Pole[z][k][m][i][j] = 0
			$"Святая Десятка".position = Vector2(-384, 240)
			Pole[z][k][m][0][4] = 0
			$"Неизменная часть/Boss_room/Закрытый проход".position.y -= 256
			min_hero_sila += 1
			$"Диалоговое окно/vubor_1".visible = true
			$"Диалоговое окно/vubor_1/Текст".text = "Далее"
			$"Диалоговое окно/vubor_2".visible = false
			$"Диалоговое окно/vubor_3".visible = false
	if $"Диалоговое окно/vubor_1/Текст".text == "Могу только вывести\nВас отсюда.":
		dialog_10(8)
		dialog_phase = 8
func _on_vubor_2_pressed():
	match $"Диалоговое окно/vubor_2/Текст".text:
		"1":
			dialog_10(1)
			dialog_phase = 1
		"Ваш\nспаситель.":
			dialog_10(2)
			dialog_phase = 2
		"Есть. Что произошло\nс Цифроградом?":
			dialog_10(4)
			dialog_phase = 4
		"Есть просьба.":
			dialog_10(5)
			dialog_phase = 5
			vub_flag = 0
		"Кого?":
			dialog_10(6)
			dialog_phase = 6
		"Я готов\nпомочь.":
			dialog_10(7)
			dialog_phase = 7
		"Да.":
			vub_flag = 0
			$"Диалоговое окно".visible = false
			game_end()
func _on_vubor_3_pressed():
	match $"Диалоговое окно/vubor_3/Текст".text:
		"3":
			hod_lock = false
			$"Диалоговое окно".visible = false
		"Случайный\nпрохожий.":
			dialog_10(3)
			dialog_phase = 3
			vub_flag = 1
		"Нет.":
			if dialog_phase != 8:
				dialog_10(3)
				dialog_phase = 3
				vub_flag = 1
			else:
				$"Диалоговое окно/Текст".text = "Жаль."
				$"Диалоговое окно/vubor_1".visible = true
				$"Диалоговое окно/vubor_1/Текст".text = "Далее"
				$"Диалоговое окно/vubor_2".visible = false
				$"Диалоговое окно/vubor_3".visible = false
				
				$"Диалоговое окно/Говорящий".visible = true
				$"Диалоговое окно/Говорящий/Текст".visible = true
				$"Диалоговое окно/Говорящий/ГКП".visible = false
				$"Диалоговое окно/Говорящий/Текст".text = "Святая Десятка"
				dialog_phase = 10
		"Согласен.":
			dialog_10(7)
			dialog_phase = 7
		"Я не могу\nпомочь.":
			dialog_10(9)
			dialog_phase = 9

func game_end():
	$"Тьма".z_index = 3
	$"Описания и кнопка".visible = true
	$"Описания и кнопка/next_button".visible = true
	$"Описания и кнопка/next_button/Текст".text = "Далее"
	match dialog_phase:
		0:$"Описания и кнопка/Описание_6".visible = true
		7:
			if vub_flag == 0:
				$"Описания и кнопка/Описание_4".visible = true
			else:
				if vub_flag == 1:
					$"Описания и кнопка/Описание_5".visible = true
		8:$"Описания и кнопка/Описание_1".visible = true
		9:$"Описания и кнопка/Описание_3".visible = true
		10:$"Описания и кнопка/Описание_2".visible = true
func _on_next_button_pressed():
	var poglot = 0
	match $"Описания и кнопка/next_button/Текст".text:
		"Далее":
			$"Описания и кнопка/Описание_1".visible = false
			$"Описания и кнопка/Описание_2".visible = false
			$"Описания и кнопка/Описание_3".visible = false
			$"Описания и кнопка/Описание_4".visible = false
			$"Описания и кнопка/Описание_5".visible = false
			$"Описания и кнопка/Описание_6".visible = false
			$"Описания и кнопка/Окончание игры".visible = true
			$"Описания и кнопка/Окончание игры_2".visible = true
			$"Описания и кнопка/Окончание игры_2".text = "P.S. Вы донесли до конца игры " + str(kol_serd[nom_podz - 1]) + " из " + str((4 - int(sl.text)) * 2) + " кристаллических сердец.\nНа это Вам потребовалось " + str(kol_smert[nom_podz - 1] + 1) + " попыток(-ки)."
			$"Описания и кнопка/next_button/Текст".text = "Главное меню"
		"Главное меню":
			poglot = get_tree().change_scene("res://Сцены/Меню.tscn")

func pred_hod(N, M):
	prisv_mass_2D(pred_rooms[2], pred_rooms[1], N, M)
	prisv_mass_2D(pred_rooms[1], pred_rooms[0], N, M)
	prisv_mass_2D(pred_rooms[0], Pole[z][k][m], N, M)
	
	for I in range(0, 2):
		for j in range(0, pred_monsters[0].size()):
			pred_monsters[2 - I][j].copy(pred_monsters[1 - I][j])
	for j in range(0, pred_monsters[0].size()):
		if j < room_mass.size():
			pred_monsters[0][j].copy(room_mass[j])
		else:
			pred_monsters[0][j].obnul()
		
	for j in range(0, 4):
		for i in range(0, 2):
			pred_param[2 - i][j] = pred_param[1 - i][j]
	pred_param[0][0] = komn_bossa(0)
	pred_param[0][1] = int($"Враги/Гигантская Королева Пауков/HP".text)*5
	pred_param[0][2] = $"HP_boss_bar".visible
	pred_param[0][3] = z + 1
#	for j in range(0, 10):
#		print(pred_monsters[0][j].x, "", pred_monsters[0][j].type, "", pred_monsters[1][j].x, "", pred_monsters[1][j].type, "",pred_monsters[2][j].x, "", pred_monsters[2][j].type, "")
#	print("\n")
	#print(pred_param[0][2], pred_param[1][2], pred_param[2][2])
func _on_pred_position_pressed():
	if i_hod < 3 - int(sl.text):
		$"Узел подсказки".visible = false
		if $"Диалоговое окно".visible == true:
			bul_dial = true
		$"Диалоговое окно".visible = false
		hod_lock = true
		i_hod += 1
		snat_vse()
		rasst(pred_rooms[i_hod], pred_monsters[i_hod], i_hod)
		if pred_param[i_hod][0]:
			$"Неизменная часть/Walls_verx".position = Vector2(-672, 242)
			$"Неизменная часть/Boss_room".position = Vector2(-3, -14)
		else:
			if $"Неизменная часть/Walls_verx".position.x == -672:
				$"Неизменная часть/Walls_verx".position = Vector2(317, 242)
				$"Неизменная часть/Boss_room".position = Vector2(-992, -14)
		if pred_param[i_hod][2]:
			$"HP_boss_bar".visible = true
			$"HP_boss_bar".value = pred_param[i_hod][1]
			$"Местонахождение".visible = false
		else:
			$"HP_boss_bar".visible = false
			$"Местонахождение".visible = true
		$"Местонахождение".text = "Подземный дворец Святой Десятки. Этаж " + str(pred_param[i_hod][3])
		$"sl_position".visible = true
		if i_hod == 3 - int(sl.text):
			$"pred_position".visible = false
		if i_hod < 2:
			if pred_rooms[i_hod + 1][0][0] == 0:
				$"pred_position".visible = false
		if i_hod == 1 && int(sl.text) < 3:
			$"Подсказка о прошлом и невозможности хода".visible = true
	else:
		$"pred_position".rect_position.y -= 20
func _on_sl_position_pressed():
	if i_hod > 0:
		$"Узел подсказки".visible = false
		i_hod -= 1
		snat_vse()
		rasst(pred_rooms[i_hod], pred_monsters[i_hod], i_hod)
		if pred_param[i_hod][0]:
			$"Неизменная часть/Walls_verx".position = Vector2(-672, 242)
			$"Неизменная часть/Boss_room".position = Vector2(-3, -14)
		else:
			if $"Неизменная часть/Walls_verx".position.x == -672:
				$"Неизменная часть/Walls_verx".position = Vector2(317, 242)
				$"Неизменная часть/Boss_room".position = Vector2(-992, -14)
		if pred_param[i_hod][2]:
			$"HP_boss_bar".visible = true
			$"HP_boss_bar".value = pred_param[i_hod][1]
			$"Местонахождение".visible = false
		else:
			$"HP_boss_bar".visible = false
			$"Местонахождение".visible = true
		$"Местонахождение".text = "Подземный дворец Святой Десятки. Этаж " + str(pred_param[i_hod][3])
		$"pred_position".visible = true
		if i_hod == 0:
			$"sl_position".visible = false
			$"Подсказка о прошлом и невозможности хода".visible = false
			if bul_dial == true:
				$"Диалоговое окно".visible = true
			else:
				hod_lock = false
	else:
		$"sl_position".rect_position.y += 20
func _on_sl_position_mouse_entered():
	$"Узел подсказки".visible = true
	if i_hod >= 2:
		$"Узел подсказки/Подсказка".text = $"sl_position/Подсказка_1".text
	else:
		$"Узел подсказки/Подсказка".text = $"sl_position/Подсказка_2".text
func _on_sl_position_mouse_exited():
	$"Узел подсказки".visible = false
func _on_pred_position_mouse_entered():
	$"Узел подсказки".visible = true
	$"Узел подсказки/Подсказка".text = $"pred_position/Подсказка".text
func _on_pred_position_mouse_exited():
	$"Узел подсказки".visible = false

func _on_Shesternya_Menu_pressed():
	$"Окошко ДаНет".visible = true
	$"pred_position".disabled = true
	$"pred_position".mouse_default_cursor_shape = Control.CURSOR_ARROW
	$"sl_position".disabled = true
	$"sl_position".mouse_default_cursor_shape = Control.CURSOR_ARROW
	hod_lock = true
func _on_Yes_pressed():
	var poglot = 0
	poglot = get_tree().change_scene("res://Сцены/Меню.tscn")
func _on_No_pressed():
	$"Окошко ДаНет".visible = false
	$"pred_position".disabled = false
	$"pred_position".mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	$"sl_position".disabled = false
	$"sl_position".mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	hod_lock = false

func _on_good_button_pressed():
	$"Подсказки".visible = false
func _on_good_button2_pressed():
	$"Оповещения о сердцах".visible = false
