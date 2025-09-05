extends Control

@onready var navigation_label: RichTextLabel = $CanvasLayer/MenuContainer/NavigationLabel
@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer


func _on_continue_button_pressed() -> void:
	var tween = get_tree().create_tween()
	
	tween.tween_property(navigation_label, "modulate", Color(0,0,0,0), 0.5)
	tween.connect("finished", on_tween_finished)

func on_tween_finished():
	animation_player.play("TapToContinue")
	
func next_scene():
	Global.game_controller.change_gui_scene("res://scenes/pages/questionnaire_page.tscn", true)
