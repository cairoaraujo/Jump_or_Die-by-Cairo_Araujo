extends Area2D

func _ready():
	
	pass

func _on_colecionaveis_body_entered(body):
	queue_free()
