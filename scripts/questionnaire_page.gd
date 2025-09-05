extends Control

#was thinking, we store the questions into an array then shuffle them
#array index serves as page from then on
@onready var transition: ColorRect = $CanvasLayer/Transition

@onready var question_content_label: RichTextLabel = $CanvasLayer/QuestionnaireUI/QuestionContentLabel
@onready var choice_button_1: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton
@onready var choice_button_2: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton2
@onready var choice_button_3: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton3
@onready var choice_button_4: ChoiceButton = $CanvasLayer/QuestionnaireUI/ChoiceButtonContainer/ChoiceButton4

@export var question_data : QuestionData
@onready var questionnaire_bank : Array[QuestionData] = [
	load("res://scripts/questions/Q1.tres"),
	load("res://scripts/questions/Q2.tres"),
	load("res://scripts/questions/Q3.tres")
]
@onready var choice_bank : Array[ChoiceData] = []

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(transition, "color", Color(0, 0, 0, 0), 0.5)
	tween.connect("finished", on_tween_finished)
	
	if Global.new_instance:
		questionnaire_bank.shuffle()
	question_data = questionnaire_bank[Global.page_number]
	
	choice_bank = [
		question_data.choice_1,
		question_data.choice_2,
		question_data.choice_3,
		question_data.choice_4
	]
	
	choice_bank.shuffle()
	
	question_content_label.text = question_data.question_txt.to_upper()
	choice_button_1.text = choice_bank[0].choice_txt.to_upper()
	choice_button_2.text = choice_bank[1].choice_txt.to_upper()
	choice_button_3.text = choice_bank[2].choice_txt.to_upper()
	choice_button_4.text = choice_bank[3].choice_txt.to_upper()

func _on_exit_button_pressed() -> void:
	Global.new_instance = true
	
	Global.total_hacker = 0
	Global.total_hipster = 0
	Global.total_hustler = 0
	Global.total_hound = 0
	
	transition.visible = true
	
	var tween = get_tree().create_tween()
	tween.tween_property(transition, "color", Color(0, 0, 0, 1), 0.7)
	
	tween.connect("finished", Global.game_controller.change_gui_scene.bind("res://scenes/pages/title_page.tscn", true))

func on_tween_finished():
	transition.visible = false

func _on_choice_button_pressed() -> void:
	var index = Global.button_pressed_id
	
	Global.total_hacker += choice_bank[index].pts_hacker 
	Global.total_hipster += choice_bank[index].pts_hipster
	Global.total_hustler += choice_bank[index].pts_hustler
	Global.total_hound += choice_bank[index].pts_hound
	Global.page_number += 1
	
	Global.new_instance = false
	
	if Global.page_number != len(questionnaire_bank):
		Global.game_controller.change_gui_scene("res://scenes/pages/questionnaire_page.tscn", true)
	else:
		Global.game_controller.change_gui_scene("res://scenes/pages/results_page.tscn")
		
