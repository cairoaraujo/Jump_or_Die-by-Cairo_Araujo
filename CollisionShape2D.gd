extends CollisionShape2D



func _on_Fim_body_entered(body):
	get_tree().change_scene("res://GameOver.tscn")
