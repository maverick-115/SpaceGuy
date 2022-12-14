extends Node
export (PackedScene) var Roca
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($PosicionDeInicio.position) #Posicion de inicion del jugador
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(Score)
	$Musica.play()


func game_over():
	$ScoreTimer.stop()
	$RocaTimer.stop()
	$Interfaz.game_over()
	$AudioMuerte.play()
	$Musica.stop()


func _on_InicioTimer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)
	

func _on_RocaTimer_timeout():
	#Seleccionar un lugar aleatorio en el camino
	$Camino/RocaPosicion.set_offset(randi())
	
	var R = Roca.instance()
	add_child(R)
	
	#selecionar una direccion
	var d = $Camino/RocaPosicion.rotation + PI/2
	
	R.position = $Camino/RocaPosicion.position
	
	d += rand_range(-PI/4 , PI/4)
	
	R.rotation = d
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max), 0).rotated(d))
	
	
	
	
	
	
	
	
	
	
