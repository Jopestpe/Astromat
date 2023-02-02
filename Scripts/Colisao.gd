extends CPUParticles2D

func _ready():
	emitting = true
	
func Destruir_Particulas():
	queue_free()
