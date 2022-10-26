extends Node2D
var pts = 0
var vid = 3
var spa=true
var spac=true
var re
const asteE =preload("res://cenas/Aste.tscn")
const asteC =preload("res://cenas/AsteC.tscn")
var tela 
func _ready():
	conta()
	$Pontos.text = 'Pontuação 0'
	$Vida.text = 'Vida 3'
	tela = get_viewport().size
func _process(_delta):
	if Input.is_action_pressed('p'):
		get_tree().change_scene("res://cenas/Menu.tscn")
	if Input.is_action_pressed('c'):
		pass
func pontuar():
	pts += 1
	$Pontos.text ='Pontuação '+str(pts)
func er():
	$Erro.visible=true
	var erro = 'Voce Errou'
	$Erro.text = str(erro)
	yield(get_tree().create_timer(1),"timeout")
	$Erro.visible=false
func vida():
	vid -= 1
	$Vida.text ='Vida '+str(vid)
	vi()
func conta():
	var n1 = randi()%13+1
	var n2 = randi()%11+1
	var r = n1+n2	
	$Conta.text = str(n1)+" + "+str(n2)+" = ?"
	re = r
func vi():
	return vid
