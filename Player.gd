extends KinematicBody2D

const SPEED = 270
const GRAVIDADE = 30
const FORCA_PULO= 800
const FLOOR = Vector2(0,-1)

var score = 0

var velocidade = Vector2()

var on_ground = false

var vida = 3

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocidade.x = SPEED
		$AnimatedSprite.play("andando")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -SPEED
		$AnimatedSprite.play("andando")
		$AnimatedSprite.flip_h = true
	else:
		velocidade.x =0
		if on_ground == true:
			$AnimatedSprite.play("parado")
		
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocidade.y = -FORCA_PULO
			on_ground = false
		
	velocidade.y = velocidade.y + GRAVIDADE
	
	if is_on_floor():
		on_ground = true
	else: 
		on_ground = false
		if velocidade.y < 0:
			$AnimatedSprite.play("pulo")
		
	velocidade = move_and_slide(velocidade, FLOOR)
	




func _on_pes_body_entered(body):
	body.dano()


func _on_dano_body_entered(body):
	vida -= 1
	print(vida)
	if vida <= 0:
		$AnimatedSprite.play("morte")
		get_tree().change_scene("res://GameOver.tscn")

		


func _on_Win_body_entered(body):
	get_tree().change_scane("res://Menu.tscn")


func _on_colecionaveis_body_entered(body):
	score += 1
	print(score)
