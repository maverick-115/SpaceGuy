extends Area2D
#var Velocidad = 400
#vamos a exportar esta misma variable a las propiedades del inspector
export (int) var Velocidad
var Movimiento = Vector2()
var limite
signal golpe
var botonArriba = false
var botonAbajo = false
var botonDerecha = false
var botonIzquierda = false

func _ready():
	hide()
	limite = get_viewport_rect().size #me guardo el tamaño de mi pantalla


func _process(delta):
	Movimiento = Vector2()#Reiniciar valor de movimiento
	if Input.is_action_pressed("ui_right") or botonDerecha:
		Movimiento.x += 1
		$Fuego.position.y = 0
	if Input.is_action_pressed("ui_left") or botonIzquierda:
		Movimiento.x -= 1
		$Fuego.position.y = 0
	if Input.is_action_pressed("ui_down") or botonAbajo:
		Movimiento.y += 1
		if (!Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right")) or (!botonIzquierda && !botonDerecha): 
			$Fuego.position.y = -120
	if Input.is_action_pressed("ui_up") or botonArriba:
		Movimiento.y -= 1
		$Fuego.position.y = 0
	if Movimiento.length() > 0 : #verificar si se esta moviendo 
		Movimiento = Movimiento.normalized() * Velocidad #normalizar la velocidad
	position += Movimiento * delta #actualizando la posicion de los movimientos
	position.x = clamp(position.x, 0, limite.x)# Le digo que el personajes no se salga de los limites de pantalla
	position.y = clamp(position.y, 0, limite.y)
	
	#animaciones
	if Movimiento.x != 0:
		$Sprite_player.animation = "lado"
		$Sprite_player.flip_h = Movimiento.x < 0
		$Sprite_player.flip_v = false #si se mueve a los costados no lo dejes cambiar el eje Y
	elif Movimiento.y !=0 :
		$Sprite_player.animation ="espalda"
		$Sprite_player.flip_v = Movimiento.y > 0
	else:
		$Sprite_player.animation="frente"
		









func _on_Player_body_entered(body): #detecta cuando hay una colision con el PJ
	hide()
	emit_signal("golpe")
	#$CollisionShape2D.disabled = true esto ya no funca desde el 3.1
	$CollisionShape2D.set_deferred("disabled", true)
	
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.set_deferred("disabled" , false)
	






func _on_bUp_pressed():
	botonArriba = true


func _on_bUp_released():
	botonArriba = false


func _on_bDown_pressed():
	botonAbajo = true


func _on_bDown_released():
	botonAbajo = false


func _on_bLeft_pressed():
	botonIzquierda = true


func _on_bLeft_released():
	botonIzquierda = false


func _on_bRight_pressed():
	botonDerecha = true


func _on_bRight_released():
	botonDerecha = false
	
