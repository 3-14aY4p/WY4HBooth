extends Control

#was thinking, we store the question IDs into an array then shuffle them
#array index serves as page from then on
@onready var transition: ColorRect = $CanvasLayer/Transition

@onready var question_content_label: RichTextLabel = $CanvasLayer/QuestionnaireUI/QuestionContentLabel
@onready var choice_button_1: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton
@onready var choice_button_2: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton2
@onready var choice_button_3: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton3
@onready var choice_button_4: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton4

@export var question_data : QuestionData
@onready var choice_bank : Array = [
		question_data.choice_1.choice_txt,
		question_data.choice_2.choice_txt,
		question_data.choice_3.choice_txt,
		question_data.choice_4.choice_txt
	]
	

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(transition, "color", Color(0, 0, 0, 0), 0.5)
	tween.connect("finished", on_tween_finished)
	
	choice_bank.shuffle()
	
	question_content_label.text = question_data.question_txt
	choice_button_1.text = choice_bank[0]
	choice_button_2.text = choice_bank[1]
	choice_button_3.text = choice_bank[2]
	choice_button_4.text = choice_bank[3]

func _on_exit_button_pressed() -> void:
	transition.visible = true
	
	var tween = get_tree().create_tween()
	tween.tween_property(transition, "color", Color(0, 0, 0, 1), 0.7)
	
	tween.connect("finished", Global.game_controller.change_gui_scene.bind("res://scenes/pages/title_page.tscn", true))

func on_tween_finished():
	transition.visible = false
