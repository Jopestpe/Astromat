extends CPUParticles2D

func _ready():
	print("explosao")
	
func Destruir_Particulas():
	print("explosao destuir")
	queue_free()
