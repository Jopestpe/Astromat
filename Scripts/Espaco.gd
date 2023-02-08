extends ColorRect

var Aleatorio = RandomNumberGenerator.new()
var Variavel_1
var Variavel_2
var Resposta_Certa
var Velocidade_Asteroide = 100
var Asteroide = preload("res://Cenas/Asteroide.tscn")
var Pontos = 0
var Vida = 3

func _ready():
	AplicarConfiguracoes()
	$Perdeu.visible = false
	$Pontos.text = str(0)
	$Vida.text = str(3)
	$Transicao.Animacao("Clarear")
	Aleatorio.randomize()
	Conta()
	$GerarAsteroide.start()

func AplicarConfiguracoes():
	$Ambiente.environment.glow_enabled =  Global.Luz
	if Global.Toque:
		var _TelaToque = preload("res://Cenas/Toque.tscn")
		var _Intancia_TelaToque = _TelaToque.instance()
		add_child(_Intancia_TelaToque)
	
	
func _input(_event):
	if Input.is_action_pressed('VOLTAR'):
		$Transicao.Animacao("Escurecer","res://Cenas/Inicial.tscn")
		
func Errou():
	$Audio_Errou.play()
		
func Nave_Bateu_Asteroide():
	Vida -=1
	$Vida.text = str(Vida)
	if Vida < 1:
		Perdeu()
		
func Pontuou():
	Conta()
	Pontos +=1
	$Pontos.text = str(Pontos)

func Perdeu():
	$Nave.queue_free()
	$Audio_Explosao.play()
	if Global.Toque:
		if has_node("Toque"):
			get_node("Toque").visible = false
	$Perdeu._Entro(Pontos)
	$GerarAsteroide.stop()
	
func Conta():
	Variavel_1 = Aleatorio.randi_range(1,10)
	Variavel_2 = Aleatorio.randi_range(1,10)
	Resposta_Certa = pow(Variavel_1,2) + pow(Variavel_2,2)
	$Conta.text = str(Variavel_1) + "²+" + str(Variavel_2) + "²"

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
	get_node("GerarAsteroide").add_child(Intancia_Asteroide)
	$GerarAsteroide.start()


