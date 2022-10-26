extends ColorRect

var Aleatorio = RandomNumberGenerator.new()
var Variavel_1
var Variavel_2
var _Voltar
var Velocidade_Asteroide = 100
var Asteroide = preload("res://Cenas/Asteroide.tscn")
var Pontos = 0
var Vida = 3

func _ready():
	$Animacao.play("Clarear")
	Aleatorio.randomize()
	Conta()
	$GerarAsteroide.start()
	
func _input(_event):
	if Input.is_action_pressed('VOLTAR'):
		_Voltar = get_tree().change_scene("res://Cenas/Astromat.tscn")
	
func Bateu():
	if Vida <= 1:
		Perdeu()
	Vida -=1
	$Vida.text = str(Vida)
		
func Pontuou():
	Pontos +=1
	$Pontos.text = str(Pontos)

func Conta():
	Variavel_1 = Aleatorio.randi_range(1,10)
	Variavel_2 = Aleatorio.randi_range(1,10)
	Global.Resposta = pow(Variavel_1,2) + pow(Variavel_2,2)
	$Conta.text = str(Variavel_1) + "² + " + str(Variavel_2) + "² = ?"

func Perdeu():
	_Voltar = get_tree().change_scene("res://Cenas/Astromat.tscn")
	
func GerarAsteroide():
	var Lado = Aleatorio.randi_range(1,8)
	var pos
	var rot
	var vel
	match Lado:
		1: 
			pos = Vector2(-50,-50)
			rot = Aleatorio.randf_range(0,1.5)
			vel = 100
		2: 
			pos = Vector2(-100,400)
			rot = Aleatorio.randf_range(-1.5,1.5)
			vel = 100
		3: 
			pos = Vector2(-100,800)
			rot = Aleatorio.randf_range(-1.5,0)
			vel = 100
		4: 
			pos = Vector2(700,-100)
			rot = Aleatorio.randf_range(0,3)
			vel = 100
		5: 
			pos = Vector2(1300,-100)
			rot = Aleatorio.randf_range(-1.5,0)
			vel = -100
		6: 
			pos = Vector2(1300,400)
			rot = Aleatorio.randf_range(-1.5,1.5)
			vel = -100
		7: 
			pos = Vector2(1300,800)
			rot = Aleatorio.randf_range(0,1.5)
			vel = -100
		8: 
			pos = Vector2(700,800)
			rot = Aleatorio.randf_range(0,3)
			vel = -100
	var Intancia_Asteroide = Asteroide.instance()
	Intancia_Asteroide.Definicoes(pos,rot,vel)
	add_child(Intancia_Asteroide)
	$GerarAsteroide.start()
