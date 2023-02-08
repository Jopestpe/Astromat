extends Node

var Luz = false
var Toque = false
var TocarMusica = false
var audio = AudioServer.get_bus_index("Master")

func _ready():
	Configuracoes_Iniciais()
	
func Configuracoes_Iniciais():
	AudioServer.set_bus_mute(audio,true)
	TranslationServer.set_locale("en_US")
	if OS.has_touchscreen_ui_hint():
		Toque = true
		

	
