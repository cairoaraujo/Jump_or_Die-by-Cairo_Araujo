extends Area2D


func _on_Win_body_entered(body):
	get_tree().change_scene("res://TelaVitoria.tscn")
