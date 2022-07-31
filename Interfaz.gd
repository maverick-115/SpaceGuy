extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout")#esperar a que el MensajeTimer de la señal timeout cuando termino de contar
	get_node("Botones").move(Vector2(600,0))
	$BotonPlay.show()
	$Mensaje.text = "Space Guy"
	$Mensaje.show()
	
	
func update_score(Puntos):
	$ScoreLabel.text = str(Puntos)

func _on_MensajeTimer_timeout():
	$Mensaje.hide()


func _on_BotonPlay_pressed():
	$BotonPlay.hide()
	emit_signal("iniciar_juego")
	get_node("Botones").move(Vector2(-600,0))
	
	
	
	


func _on_BotonIz_pressed():
	pass # Replace with function body.
