extends Control


func _on_ir_dnv_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_sair_pressed():
	get_tree().quit()
