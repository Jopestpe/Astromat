extends ColorRect
	
func Jogar_Novamente():
	$Transicao.Animacao("Escurecer","res://Cenas/Espaco.tscn")

func _Entro(Pontos):
	$Pontos.text = str(Pontos)
	visible = true
	$AnimationPlayer.play("Expandir")
	
func Girar():
	$AnimationPlayer.play("Girar_Asteroide")
