extends Control

var _Control
var _OS
var Configurar_Aberto = false

func _ready():
	$Transicao.Animacao("Clarear")
	
func Jogar():
	$Transicao.Animacao("Escurecer","res://Cenas/Jogo.tscn")

func Clico_Criador(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://twitter.com/Jopestpe") 

func Clico_Feito(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://godotengine.org/license") 

func Clico_Fonte(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		_OS = OS.shell_open("https://www.extraboldfoundry.com/meraki") 
	
func Configuracao():
	if Configurar_Aberto:
		$Animacao.play("Fechar_Configuracoes")
	else:
		$Animacao.play("Abrir_Configuracoes")


