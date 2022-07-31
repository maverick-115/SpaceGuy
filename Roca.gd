extends RigidBody2D

# warning-ignore:unused_class_variable
export (int) var velocidad_min
# warning-ignore:unused_class_variable
export (int) var velocidad_max
var tipo_roca = ["grande" , "chiquito"]

func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	
	if $AnimatedSprite.animation == "grande":
		$CollisionShape2D.scale.x = 1.5
		$CollisionShape2D.scale.y = 1.5

func _on_Visibilidad_screen_exited():
	queue_free() # Se borra de memoria
	
