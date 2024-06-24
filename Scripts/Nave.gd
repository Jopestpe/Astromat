extends CharacterBody2D

@onready var Jogo = get_parent()
var Carregado = true
var Velocidade_Nave = 350
var Mover = Vector2()

func _input(_event):
	if Input.is_action_pressed('Disparar'):
		Disparar()
		
func Disparar():
	if Carregado:
		%Disparo.play()
		var IntanciaDisparo = preload("res://Cenas/Projetil.tscn").instantiate()
		IntanciaDisparo.rotation_degrees = rotation_degrees 
		IntanciaDisparo.global_position = global_position
		get_parent().add_child(IntanciaDisparo)
		Carregado = false
		$Recarregar.start()		
		
func _physics_process(_delta):
	look_at(get_global_mouse_position())
	if position.x > get_viewport_rect().size.x:
			position.x = 0
	if position.x < 0:
			position.x = get_viewport_rect().size.x
	if position.y > get_viewport_rect().size.y:
			position.y = 0
	if position.y < 0:
			position.y = get_viewport_rect().size.y
	Mover = Vector2.ZERO
	if Input.is_action_pressed("Costas"):
		Mover.y += 1
	if Input.is_action_pressed("Frente"):
		Mover.y -= 1
	if Input.is_action_pressed("Direita"):
		Mover.x += 1
	if Input.is_action_pressed("Esquerda"):
		Mover.x -= 1
	Mover = Mover.normalized() * Velocidade_Nave * _delta
	Mover = move_and_collide(Mover)
	
func Recarregado():
	Carregado = true

func ColisaoComAsteroide():
	Jogo.PerderVida()
	%Animar.play("Estilhacar")
	%Estilhaco.restart()
	%Batida.play()

func Destruir():
	%Destruir.play("Destruir")
	set_process_input(false)


	
