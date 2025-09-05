extends Control

@onready var result_label: RichTextLabel = $CanvasLayer/GraphicsContainer/ResultLabel
@onready var description_label: RichTextLabel = $CanvasLayer/GraphicsContainer/DescriptionLabel


func _ready() -> void:
	Global.page_number = 0
	
	Global.get_result()
	description_label.text = Global.H_description
	result_label.text = Global.result_H

func _on_return_button_pressed() -> void:
	Global.game_controller.change_gui_scene("res://scenes/pages/title_page.tscn")
