extends Area2D

@onready var Aleatorio = RandomNumberGenerator.new()
@onready var Jogo = get_parent().get_parent()
var Certo
var Numero
var Dificuldade = 10
var Direcao
var Velocidade 

func _ready():
	%Animar.play("RESET")
	Aleatorio.randomize()
	Certo = Aleatorio.randi_range(1,5)
	if Certo == 5:
		Numero = Jogo.RespostaCerta
	else:
		Numero = Aleatorio.randi_range(
			Jogo.RespostaCerta - Dificuldade,
			Jogo.RespostaCerta + Dificuldade)
	$Numero.text = str(Numero)

func Definicoes(DefinirPosicao,DefinirDirecao,DefinirVelocidade):
	global_position = DefinirPosicao
	Direcao = DefinirDirecao
	Velocidade = DefinirVelocidade
	
func _process(_delta):
	%Imagem.rotation += 1 * _delta
	position += Vector2(Velocidade, 0).rotated(Direcao) * _delta

func AsteroideSaiuDaTela():
	queue_free()

func AsteroideColidiuComCorpo(Corpo):
	if Corpo.is_in_group("Nave"):
		Corpo.ColisaoComAsteroide()
	if Corpo.is_in_group("Projetil"):
		Corpo.queue_free()
		if Numero == Jogo.RespostaCerta:
			Quebrar()
		else:
			Jogo.Errou()
	
func Quebrar():
	Jogo.Pontuou()
	%Explosao.play()
	%Animar.play("QuebrarAsteroide")
