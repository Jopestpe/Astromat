extends ColorRect

var Cena = null

func Animacao(Animacao_Escolhida,Cena_Escolhida=null):
	Cena = Cena_Escolhida
	$AnimaTransicao.play(Animacao_Escolhida)
	
func Nova_Cena():
	if Cena != null:
		var _Nova_Cena = get_tree().change_scene(Cena)
