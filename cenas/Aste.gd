extends StaticBody2D
var cena
var meunum 
var res
func _ready():
	cena = get_tree().get_current_scene()
	mn()
	$Label.text = str(meunum)
func _process(delta):
	$AnimatedSprite.rotation += 1 * delta
func mn():
	var al = randi()%3+1
	if al == 1:
		meunum = res
	else:
		meunum = randi()%21+1
func dano():
	cena.er()
	cena.vida()
	cena.conta()
func destroir():
	get_node("Area2D/CollisionShape2D").disabled= true
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.play('destroi')
	get_node("AnimatedSprite").play("destroi")
	yield(get_tree().create_timer(0.5),"timeout")
	queue_free()
func _on_Area2D_body_entered(body):
	print('entroo')
	body.dano()
	body.destroir()
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
