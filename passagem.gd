extends Area2D


func _ready():
	pass 

func _on_passagem_body_entered(body):
	get_tree().change_scene("CENA2.tscn")
