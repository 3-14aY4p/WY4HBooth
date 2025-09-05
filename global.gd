extends Node

var game_controller : GameController

#current page to track how many questions are left
var new_instance : bool = true
var page_number : int = 0

#total score for each category
var total_hacker : int = 0
var total_hipster : int = 0
var total_hustler : int = 0
var total_hound : int = 0

#tracking the button pressed
var button_pressed_id : int = 0

#for getting results
var result_H : String
var H_description : String
func get_result():
	var total = [
		total_hacker,
		total_hipster,
		total_hustler,
		total_hound
	]
	var total_max = total.max()
	
	if total_hacker == total_max:
		result_H = "HACKER"
		H_description = "The problem solver: Analytical and logical, you love breaking challenges down."
	elif total_hipster == total_max:
		result_H = "HIPSTER"
		H_description = "The creative soul: You care about originality, style, and connection."
	elif total_hustler == total_max:
		result_H = "HUSTLER"
		H_description = "The voice of the team: Confident, persuasive, and full of energy."
	elif total_hound == total_max:
		result_H = "HOUND"
		H_description = "The researcher: Detail-oriented, thorough, and fact-driven."
