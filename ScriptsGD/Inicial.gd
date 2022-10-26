extends Control

var _Control
var _OS
var Configurar_Aberto = false

func _ready():
	$Animacao.play("Clarear")
	
func Jogar():
	$Escurecer.visible = true
	$Animacao.play("Escurecer")
	
func Espaco():
	_Control = get_tree().change_scene("res://Cenas/Espaco.tscn")

func Clico_Criador(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://twitter.com/Jopestpe") 

func Clico_Feito(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://godotengine.org/license") 

func Clico_Fonte(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://fonts.google.com/specimen/Righteous") 
	
func Configuracao():
	if Configurar_Aberto:
		$Animacao.play("Fechar_Configuracoes")
	else:
		$Animacao.play("Abrir_Configuracoes")


