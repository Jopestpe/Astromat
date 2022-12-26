extends ColorRect

func Animacao(Animacao_Escolhida,Cena_Escolhida=null):
	print(Cena_Escolhida)
	$Animacao.play(Animacao_Escolhida)
	
func Nova_Cena(Caminho):
	var _Nova_Cena = get_tree().change_scene(Caminho)
