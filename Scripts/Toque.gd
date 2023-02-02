extends Area2D

onready var raio = $CollisionShape2D.shape.radius
var toque = false
var Velocidade_Nave = 15 * 1000
var dispara

func _on_TextureRect_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		var _Voltar = get_tree().change_scene("res://Cenas/Inicial.tscn")
		
func _input(event):
	if event is InputEventScreenTouch:
		var distancia = event.position.distance_to($Circulo_Grande.global_position)
		if not toque:
			if distancia < raio:
				toque = true
		else:
			$Circulo_Pequeno.position = Vector2(0,0)
			toque = false
			
func _physics_process(_delta):
	if toque:
		$Circulo_Pequeno.global_position = get_global_mouse_position()				
		$Circulo_Pequeno.position = $Circulo_Grande.position + \
		($Circulo_Pequeno.position - $Circulo_Grande.position).limit_length(float(raio))
		var Mover = Vector2(0,0)
		Mover.x = $Circulo_Pequeno.position.x / raio
		Mover.y = $Circulo_Pequeno.position.y / raio
		if get_parent().get_parent().name == "Espaco":
			if get_parent().get_parent().has_node("Nave"):
				get_parent().get_parent().get_node("Nave").look_at(Mover)
				Mover = (Mover * Velocidade_Nave) * _delta
				get_parent().get_parent().get_node("Nave").move_and_slide(Mover)
				get_parent().get_parent().get_node("Nave").look_at(
					get_parent().get_parent().get_node("Nave").global_position +
					Mover
				)
	if dispara:
		if get_parent().get_parent().name == "Espaco":
			if get_parent().get_parent().has_node("Nave"):
				get_parent().get_parent().get_node("Nave").Disparar()
	
func _on_Disparar_button_up():
	dispara = false
	
func _on_Disparar_button_down():
	dispara = true
