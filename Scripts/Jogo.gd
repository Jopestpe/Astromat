extends Control

@onready var Aleatorio = RandomNumberGenerator.new()
var RespostaCerta
var Pontos = 0
var Vida = 3

func _ready():
	%Animar.play("AbrirTela")
	Aleatorio.randomize()
	Conta()
	%GerarAsteroide.start()
	
func _input(_event):
	if Input.is_action_pressed('Voltar'):
		%Animar.play("VoltarAoInicio")
		
func Voltar():
	var _Inicio = get_tree().change_scene_to_file("res://Cenas/Inicial.tscn")
	
func Pontuou():
	Conta()
	Pontos +=1
	%Pontos.text = str(Pontos)
	
func Conta():
	var Variavel1 = Aleatorio.randi_range(1,10)
	var Variavel2 = Aleatorio.randi_range(1,10)
	RespostaCerta = pow(Variavel1,2) + pow(Variavel2,2)
	%Conta.text = str(Variavel1) + "² + " + str(Variavel2) + "²"

func PerderVida():
	Vida -= 1
	%Vidas.text = str(Vida)
	if Vida < 1:
		%Nave.Destruir()
		%Explosao.play()
		%PontosFinais.text = str(Pontos)
		$AnimarAcabou.play("AcabouSurgir")
		$GerarAsteroide.stop()
		
func GirarAcabou():
	$AnimarAcabou.play("GirarAcabou")
		
func Errou():
	%Errou.play()

func Novamente():
	%Animar.play("IrParaJogo")
	
func EmCimaNovamente():
	%AnimarNovamente.play("EmCimaNovamente")

func SaiuNovamente():
	%AnimarNovamente.play("SaiuNovamente")
		
func TrocarParaJogo():
	var _Jogar = get_tree().change_scene_to_file("res://Cenas/Jogo.tscn")
		
func GerarAsteroide():
	var Lado = Aleatorio.randi_range(1,8)
	var AsteroidePosicao
	var AsteroideDirecao
	var AsteroideVelocidade
	var IntanciaAsteroide = preload("res://Cenas/Asteroide.tscn").instantiate()
	match Lado:
		1: # Esquerda Em cima
			AsteroidePosicao = Vector2(
				- 100,
				- 100)
			AsteroideDirecao = Aleatorio.randf_range(0,1.5)
			AsteroideVelocidade = 100
		2: # Esquerda No Centro 
			AsteroidePosicao = Vector2(
				- 100,
				get_viewport_rect().size.y / 2)
			AsteroideDirecao = Aleatorio.randf_range(-1.5,1.5)
			AsteroideVelocidade = 100
		3: # Esquerda Em Baixo
			AsteroidePosicao = Vector2(
				- 100,
				get_viewport_rect().size.y + 100)
			AsteroideDirecao = Aleatorio.randf_range(-1.5,0)
			AsteroideVelocidade = 100
		4: # Direita Em Cima
			AsteroidePosicao = Vector2(
				get_viewport_rect().size.x + 100,
				- 100)
			AsteroideDirecao = Aleatorio.randf_range(-1.5,0)
			AsteroideVelocidade = -100
		5: # Centro Em Cima
			AsteroidePosicao = Vector2(
				get_viewport_rect().size.x / 2,
				- 100)
			AsteroideDirecao = Aleatorio.randf_range(0,3)
			AsteroideVelocidade = 100
		6: # Direita Centro
			AsteroidePosicao = Vector2(
				get_viewport_rect().size.x + 100,
				get_viewport_rect().size.y / 2)
			AsteroideDirecao = Aleatorio.randf_range(-1.5,1.5)
			AsteroideVelocidade = -100
		7: # Direita Em Baixo
			AsteroidePosicao = Vector2(
				get_viewport_rect().size.x + 100,
				get_viewport_rect().size.y + 100)
			AsteroideDirecao = Aleatorio.randf_range(0,1.5)
			AsteroideVelocidade = -100
		8: # Centro em Baixo
			AsteroidePosicao = Vector2(
				get_viewport_rect().size.x / 2,
				get_viewport_rect().size.y + 100)
			AsteroideDirecao = Aleatorio.randf_range(0,3)
			AsteroideVelocidade = -100
	IntanciaAsteroide.Definicoes(
				AsteroidePosicao,
				AsteroideDirecao,
				AsteroideVelocidade)
	get_node("Asteroides").add_child(IntanciaAsteroide)
	%GerarAsteroide.start()



