extends Control

var CanalDeAudio = AudioServer.get_bus_index("Master")
var _Idiomas = {
		0 	: "en_US", 
		1	: "es", 
		2	: "pt_BR"
	}
	
func _ready():
	%AlterarVolume.value = AudioServer.get_bus_volume_db(CanalDeAudio)
	%Idiomas.select(_Idiomas.find_key(str(TranslationServer.get_locale()))) 
	%Musica.play()
	$tocar_musica.start()
	%Animar.play("AbrirTela")
	
func AlterarVolume(_Altura):
	if _Altura == %AlterarVolume.min_value:
		AudioServer.set_bus_mute(CanalDeAudio,true)
	else:
		AudioServer.set_bus_mute(CanalDeAudio,false)
	AudioServer.set_bus_volume_db(CanalDeAudio,_Altura)
	if not %Musica.playing:
		%TesteVolume.play()

func Ajustes(Abrir):
	if Abrir == true:
		%AnimarAjustes.play("AbrirAjustes")
	elif Abrir == false:
		%AnimarAjustes.play("FecharAjustes")

func Criador(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		var _OS = OS.shell_open("https://twitter.com/Jopestpe") 

func Motor(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		var _OS = OS.shell_open("https://godotengine.org/license")

func EmCimaAJuste():
	%Animar.play("EmCimaAjustes")
	
func SaiuCimaAjuste():
	%Animar.play("SaiuAjustes")

func EmCimaCriador():
	%Criador.modulate = Color (0.0,0.0,0.0,1.0)
	%CriadorSelecionar.modulate = Color (1.0,1.0,1.0,1.0)
	
func SaiuCriador():
	%Criador.modulate = Color (1.0,1.0,1.0,1.0)
	%CriadorSelecionar.modulate = Color (0.0,0.0,0.0,1.0)
	
func EmCimaMotor():
	%Motor.modulate = Color (0.0,0.0,0.0,1.0)
	%MotorSelecionar.modulate = Color (1.0,1.0,1.0,1.0)

func SaiuMotor():
	%Motor.modulate = Color (1.0,1.0,1.0,1.0)
	%MotorSelecionar.modulate = Color (0.0,0.0,0.0,1.0)

func EmCimaJogar():
	%Animar.play("EmCimaJogar")

func SaiuJogar():
	%Animar.play("SaiuJogar")
	
func JogarApertado():
	%AnimarIr.play("IrParaJogo")
	
func TrocarParaJogo():
	var _Jogar = get_tree().change_scene_to_file("res://Cenas/Jogo.tscn")

func IdiomaSelecionado(_Idioma):
	TranslationServer.set_locale(_Idiomas[_Idioma])

func Atualizar(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		JavaScriptBridge.eval("location.reload(true);")

func AtualizarEntrou():
	%Atualizar.modulate = Color (0.0,0.0,0.0,1.0)
	%AtualizarSelecionar.modulate = Color (1.0,1.0,1.0,1.0)

func AtualizarSaiu():
	%Atualizar.modulate = Color (1.0,1.0,1.0,1.0)
	%AtualizarSelecionar.modulate = Color (0.0,0.0,0.0,1.0)

func Expandir(Expandido):
	if Expandido == true:
		JavaScriptBridge.eval("
		document.documentElement.requestFullscreen();")
	if Expandido == false:
		JavaScriptBridge.eval("
		document.exitFullscreen();")


func tocar_musica():
	%Musica.play()
	$tocar_musica.start()
