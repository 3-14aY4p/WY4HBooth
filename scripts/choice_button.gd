class_name ChoiceButton extends Button

@export var choice_index : int = 0


func _on_pressed() -> void:
	Global.button_pressed_id = choice_index
