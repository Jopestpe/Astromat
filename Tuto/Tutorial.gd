extends Node2D
var pts = 0
var vid = 3
var re
var tela
var control
var tutoim = 1 
const natu =preload("res://Tuto/NaveTut.tscn")
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
	$TimerErro.start()
	$Errar.play()
	$Erro.show()
	var erro = 'Ao errar a conta você perde uma nave'
	$Erro.text = str(erro)
func colid():
	$timeColidir.start()
	$Errar.play()
	$colidir.show()
	var col = 'Ao colidir com um asteroide você perde uma nave'
	$colidir.text = str(col)
func vida():
	vid -= 1
	$Vida.text =str(vid)
	vi()
func conta():
	$Conta.text = "6² + 8² = ?²"
	re = 100
func res():
	return re
func vi():
	return vid
func _on_Button_pressed():
	$botao.play()
	tutoim +=1
	if tutoim == 1:
		$Tutoimgs.play('explica')
	if tutoim == 2:
		$Tutoimgs.play('exemplo')
	if tutoim == 3:
		$Tutoimgs.play('controle')
	if tutoim == 4:
		$Tutoimgs.hide()
		$Pontos.show()
		$t4.show()
	if tutoim == 5:
		$t4.hide()
		$t5.show()
		$Conta.show()
	if tutoim == 6:
		$t5.hide()
		$t6.show()
		$Vida.show()
	if tutoim == 7:
		$t6.hide()
		$t7.show()
	if tutoim == 8:
		$t7.hide()
		$t8.show()
		$Button.hide()
		var natui = natu.instance()
		natui.position = tela / 2
		get_tree().get_root().add_child(natui)
		$AsteTuto.show()
		$AsteTuto2.show()
func tutofim():
	$t8.hide()
	$Button2.text = "Jogar"
	$t9.show()
	$Button2.show()
func _on_Button2_pressed():
	var enemies = get_tree().get_nodes_in_group("Tutor")
	for ast in enemies:
		ast.queue_free()
	control = get_tree().change_scene("res://cenas/Jogo.tscn")
func _on_Timer2_timeout():
	$Erro.hide()
func _on_timeColidir_timeout():
	$colidir.hide()
