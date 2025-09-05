class_name ChoiceButton extends Button

@export var choice_data : ChoiceData


func _on_pressed() -> void:
	Global.total_hacker += choice_data.pts_hacker
	Global.total_hipster += choice_data.pts_hipster
	Global.total_hustler += choice_data.pts_hustler
	Global.total_hound += choice_data.pts_hound
