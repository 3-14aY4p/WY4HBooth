extends Control

#was thinking, we store the question IDs into an array then shuffle them
#array index serves as page from then on
@onready var transition: ColorRect = $CanvasLayer/Transition


func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(transition, "color", Color(0, 0, 0, 0), 0.5)
	tween.connect("finished", on_tween_finished)
	
	#shuffle an array of questions here

func _on_exit_button_pressed() -> void:
	transition.visible = true
	
	var tween = get_tree().create_tween()
	tween.tween_property(transition, "color", Color(0, 0, 0, 1), 0.7)
	
	tween.connect("finished", Global.game_controller.change_gui_scene.bind("res://scenes/pages/title_page.tscn", true))

func on_tween_finished():
	transition.visible = false
