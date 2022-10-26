extends RigidBody2D
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
func _on_Tiro_body_entered(body):
	body.dano()
	queue_free()
func nome():
	var nome='tiro'
	return nome
func dano():
	pass
