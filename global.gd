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
