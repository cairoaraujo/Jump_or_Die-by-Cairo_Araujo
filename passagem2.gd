extends Area2D


func _ready():
	pass 

func _on_passagem_body_entered(body):
	print("encostou")
	get_tree().change_scene("CENA3.tscn")