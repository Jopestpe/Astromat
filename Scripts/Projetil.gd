extends RigidBody2D

func _ready():
	apply_impulse(
		Vector2(1000,0).rotated(rotation),
		Vector2())
	
func ProjetilSaiuDaTela():
	queue_free()
