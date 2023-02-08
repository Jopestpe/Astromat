extends Control

var _Control
var _OS
var Configurar_Aberto = false
var audio = AudioServer.get_bus_index("Master")
var _idiomas = {
		0 	: "en_US", 
		1	: "es", 
		2	: "pt_BR"
		}
var _idiomas2 = {
		"en_US" : 0,
		"es" 	: 1,
		"pt_BR"	: 2
		}		
		
func _ready():
	if Global.TocarMusica:
		$Musica.play()
	$Transicao.Animacao("Clarear")
	$"%Neon".pressed = Global.Luz
	$"%Musica".pressed = Global.TocarMusica
	$"%Toque".pressed = Global.Toque
	$"%Nivel".text = str(AudioServer.get_bus_volume_db(audio) * 10) + "% "
	$"%NivelVolume".value = AudioServer.get_bus_volume_db(audio)
	$"%Lista_Idiomas".select(_idiomas2.get(TranslationServer.get_locale(),true))
	
		
func Jogar():
	$Musica.stop()
	$Transicao.Animacao("Escurecer","res://Cenas/Espaco.tscn")
		
func Configuracao():
	if Configurar_Aberto:
		$Animacao.play("Fechar_Configuracoes")
	else:
		$Animacao.play("Abrir_Configuracoes")

func Idioma_selecionado(_index):
	TranslationServer.set_locale(_idiomas[_index])
	
func Mudar_Neon(button_pressed):
	Global.Luz = button_pressed
	
func Ligar_Desligar_Toque(button_pressed):
	Global.Toque = button_pressed

func _on_Musica_toggled(button_pressed):
	Global.TocarMusica = button_pressed
	
func Mudar_Volume(value):
	
	if value == $"%NivelVolume".min_value:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
	AudioServer.set_bus_volume_db(audio,value)
	$"%Nivel".text = str(value*10) + "% "
	if not $Musica.playing:
		$Volume.play()
	
	
func Criado_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://twitter.com/Jopestpe") 

func Feito_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://godotengine.org/license")

func _exit_tree():
	if $Volume.playing or $Musica.playing:
		$Musica.stop()
		$Volume.stop()
		

