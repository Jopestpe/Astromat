extends ColorRect

func Jogar_Novamente():
	if get_parent().has_node("Transicao"):
		get_parent().get_node("Transicao").Animacao("Escurecer","res://Cenas/Espaco.tscn")
	
func _Entro(Pontos):
	$Pontos.text = str(Pontos)
	visible = true
	$AnimationPlayer.play("Expandir")
		
func Girar():
	$AnimationPlayer.play("Girar_Asteroide")

