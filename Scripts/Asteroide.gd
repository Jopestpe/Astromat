extends Area2D

onready var Resultado
var Aleatorio = RandomNumberGenerator.new()
var Certa
var Numero
var Dificuldade = 10
var Velocidade = 100
var Direcao = 0
var Asteroide_Explosao = preload("res://Cenas/Destruir.tscn")
var Bateu = preload("res://Cenas/Colisao.tscn")
var Espaco

func _ready():
	Espaco = get_parent().get_parent()
	Aleatorio.randomize()
	Certa = Aleatorio.randi_range(1,5)
	if Certa == 5:
		Numero = Espaco.Resposta_Certa
	else:
		Numero = Aleatorio.randi_range(Espaco.Resposta_Certa-Dificuldade,Espaco.Resposta_Certa+Dificuldade)
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
		Espaco.Nave_Bateu_Asteroide()
		var Instancia_Bateu = Bateu.instance()
		Instancia_Bateu.global_position = Corpo.global_position
		Espaco.add_child(Instancia_Bateu)
	if Corpo.is_in_group("Disparo"):
		Corpo.queue_free()
		Asteroide_Recebeu_Disparo()
		
func Asteroide_Recebeu_Disparo():
	if Numero == Espaco.Resposta_Certa:
		Espaco.Pontuou()
		Quebrar()
	else:
		Espaco.Errou()
	
func Quebrar():
	var Instancia_Asteroide_Explosao = Asteroide_Explosao.instance()
	Instancia_Asteroide_Explosao.global_position = global_position
	Espaco.add_child(Instancia_Asteroide_Explosao)
	queue_free()
	
func Saiu_Da_Tela():
	queue_free()

func Acabou_TempoParticulas():
	queue_free()
