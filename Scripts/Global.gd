extends Node

var Resposta
	
func Acertou_A_Resposta():
	get_parent().get_node("Espaco").Pontuou()
	get_parent().get_node("Espaco").Conta()
	
func Errou_A_Resposta():
	get_parent().get_node("Espaco").Bateu()

func Nave_Colidiu_Asteroide():
	get_parent().get_node("Espaco").Bateu()
