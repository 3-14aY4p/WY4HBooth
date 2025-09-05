extends Control


func _on_return_button_pressed() -> void:
	Global.game_controller.change_gui_scene("res://scenes/pages/title_page.tscn")
