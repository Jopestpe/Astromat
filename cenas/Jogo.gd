extends Node2D
var pts = 0
var vid = 3
var re
const asteE =preload("res://cenas/Aste.tscn")
const asteC =preload("res://cenas/AsteC.tscn")
const asteB =preload("res://cenas/AsteB.tscn")
const asteD =preload("res://cenas/AsteD.tscn")
var tela 
var control 
func _ready():
	conta()
	$Pontos.text = '0'
	$Vida.text = '3'
	tela = get_viewport().size
func _process(_delta):
	if Input.is_action_pressed('p'):
		control = get_tree().change_scene("res://cenas/Menu.tscn")
func pontuar():
	pts += 1
	$Pontos.text =str(pts)
func er():
	$Nave/Errar.play()
	$Erro.show()
	var erro = 'Voce Errou'
	$Erro.text = str(erro)
func vida():
	vid -= 1
	$Vida.text =str(vid)
	vi()
func conta():
	var n1 = randi()%10+1
	var n2 = randi()%10+1
	var r = pow(n1,2)+pow(n2,2)
	$Conta.text = str(n1)+"² + "+str(n2)+"² = ?²"
	re = r
func res():
	return re
func vi():
	return vid
func po():
	return pts
func spawn():
	var aste = asteE.instance()
	var pos = Vector2()
	pos.x = 0
	pos.y = rand_range(16,tela.y-16)
	aste.position.x=pos.x
	aste.position.y=pos.y
	get_tree().get_root().add_child(aste)
func spawnC():
	var aste = asteC.instance()
	var posc = Vector2()
	posc.x = rand_range(16,tela.x-16)
	posc.y = -50
	aste.position.x=posc.x
	aste.position.y=posc.y
	get_tree().get_root().add_child(aste)
func spawnB():
	var aste = asteB.instance()
	var posb = Vector2()
	posb.x = rand_range(16,tela.x-16)
	posb.y = 650
	aste.position.x=posb.x
	aste.position.y=posb.y
	get_tree().get_root().add_child(aste)
func spawnD():
	var aste = asteD.instance()
	var posd = Vector2()
	posd.x = 1050
	posd.y = rand_range(16,tela.y-16)
	aste.position.x=posd.x
	aste.position.y=posd.y
	get_tree().get_root().add_child(aste)
func _on_Timer_timeout():
	spawn()
	spawnC()
	spawnB()
	spawnD()
func _on_Timer2_timeout():
	$Erro.hide()
func vempo01():
	$perdeu.vempo()
func perdeu():
	$Pontos.hide()
	$Conta.hide()
	$Vida.hide()
