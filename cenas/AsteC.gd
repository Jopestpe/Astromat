extends StaticBody2D
var cena
var meunum 
var res
func _ready():
	cena = get_tree().get_current_scene()
	mn()
	$Label2.text = str(meunum)
func _process(delta):
	$AnimatedSprite2.rotation += 1 * delta
func mn():
	var al = randi()%3+1
	if al == 1:
		meunum = res
	else:
		meunum = randi()%21+1
func dano():
	get_node("Area2D2/CollisionShape2D").disabled= true
	$AudioStreamPlayer2D2.play()
	$AnimatedSprite2.play('destroi')
	get_node("AnimatedSprite2").play("destroi")
	yield(get_tree().create_timer(0.5),"timeout")
	queue_free()
	cena.pontuar()
	cena.conta()
func destroir():
	get_node("Area2D/CollisionShape2D").disabled= true
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.play('destroi')
	get_node("AnimatedSprite").play("destroi")
	yield(get_tree().create_timer(0.5),"timeout")
	queue_free()
func _on_VisibilityNotifier2D2_screen_exited():
	queue_free()
func _on_Area2D2_body_entered(body):
	body.dano()
	body.destroir()
