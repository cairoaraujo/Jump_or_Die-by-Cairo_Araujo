extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.7

func _ready():
	$AnimatedSprite.play("walk")
	posicao_inicial = $".".position.x 
	posicao_final = posicao_inicial + 550

func _process(delta):
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$AnimatedSprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$AnimatedSprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true
			
func dano():
	$AnimatedSprite.play("morreu")
	posicao_final -=posicao_inicial
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
