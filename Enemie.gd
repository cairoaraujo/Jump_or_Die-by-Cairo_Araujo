extends KinematicBody2D

const SPEED = 100
const GRAVIDADE = 110
const FLOOR = Vector2(0,-1)

var velocidade = Vector2()
var direcao = 1

func _physics_process(delta):
	velocidade.x = SPEED * direcao
	
	if direcao == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
		
	$AnimatedSprite.play("inimigo_andando")
	
	velocidade.y += GRAVIDADE
	
	velocidade = move_and_slide(velocidade, FLOOR)

	if is_on_wall():
		direcao = direcao * -1
		$RayCast2D.position.x *= -1
		
	