extends Area2D

onready var Resultado
var Aleatorio = RandomNumberGenerator.new()
var Certa
var Numero
var Dificuldade = 10
var Velocidade = 100
var Direcao = 0
var Asteroide_Explosao = preload("res://Cenas/Destruir.tscn")

func _ready():
	Aleatorio.randomize()
	Certa = Aleatorio.randi_range(1,5)
	if Certa == 5:
		Numero = Global.Resposta
	else:
		Numero = Aleatorio.randi_range(Global.Resposta-Dificuldade,Global.Resposta+Dificuldade)
	$Numero.text = str(Numero)

func Definicoes(Espaco_Posicao,Espaco_Direcao,Espaco_Velocidade):
	global_position = Espaco_Posicao
	Direcao = Espaco_Direcao
	Velocidade = Espaco_Velocidade
	
func _process(_delta):
	$Imagem.rotation += 1 * _delta
	position += Vector2(Velocidade, 0).rotated(Direcao) * _delta
	
func Colidiu(Corpo):
	if Corpo.is_in_group("Nave"):
		Global.Nave_Colidiu_Asteroide()
	if Corpo.is_in_group("Disparo"):
		Corpo.queue_free()
		Asteroide_Recebeu_Disparo()
		
func Asteroide_Recebeu_Disparo():
	if Numero == Global.Resposta:
		Global.Acertou_A_Resposta()
		Quebrar()
	else:
		Global.Errou_A_Resposta()
	
func Quebrar():
	print("quebrar")
	var Instancia_Asteroide_Explosao = Asteroide_Explosao.instance()
	Instancia_Asteroide_Explosao.global_position = global_position
	get_parent().add_child(Instancia_Asteroide_Explosao)
	queue_free()

func Saiu_Da_Tela():
	queue_free()
