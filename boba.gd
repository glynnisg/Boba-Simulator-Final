'''
Glynnis and Rachel

Note: 
Automated testing is not practical in Godot for this project because the functions directly interact with the scene tree and node visibility. 
These visual changes require the game to be running and would interfere with actual game elements. However, all functions were manually tested in-game and confirmed to work as intended. 
'''

extends Node2D

var current_step = 0
var steps = ["Ice_Section", "Flavor_Section", "Toppings_Section"]
var labels = ["Ice_Label", "Flavor_Label", "Toppings_Label"] 


func _ready():
	for i in range(steps.size()):
		$TabBackground.get_node(steps[i]).visible = (i == current_step)
		$TabBackground.get_node(labels[i]).visible = (i == current_step)  
	$Back.visible = false 
'''
Author: Glynnis
Contract: [] -> []
Description: Runs automatically when the scene is loaded. `current_step` keeps track of which section is currently active (starts at 0, so the Ice section is active by default). The function loops through the `steps` array, showing only the active section and hiding the others. It does the same for the corresponding labels. By default, the Back button is hidden on startup.
Tests: 
The game starts with the Ice section and label, with the Back button hidden until the Next button is pressed.
'''


func _on_next_pressed():
	if current_step < steps.size() - 1:
		$TabBackground.get_node(steps[current_step]).visible = false
		$TabBackground.get_node(labels[current_step]).visible = false

		current_step += 1

		$TabBackground.get_node(steps[current_step]).visible = true
		$TabBackground.get_node(labels[current_step]).visible = true

		$Back.visible = (current_step > 0)
		$Next.visible = (current_step < steps.size() - 1)
'''
Author: Glynnis
Contract: (button pressed) -> []
Description: When the Next button is pressed, if there is a next step available, the function hides the current section and label, advances to the next step, and makes the new section and label visible. It also updates the visibility of the Back and Next buttons based on the current position.
Tests: 
In game, you are able to successfully switch between the three sections and see how the function updates the visibility of the next and back buttons.
'''


func _on_back_pressed():
	if current_step > 0:
		$TabBackground.get_node(steps[current_step]).visible = false
		$TabBackground.get_node(labels[current_step]).visible = false

		current_step -= 1

		$TabBackground.get_node(steps[current_step]).visible = true
		$TabBackground.get_node(labels[current_step]).visible = true

		$Back.visible = (current_step > 0)
		$Next.visible = (current_step < steps.size() - 1)
'''
Author: Glynnis
Contract: (button pressed) -> []
Description: When the Back button is pressed, if the current step is not the first step, the function hides the current section and label, moves back to the previous step, and makes the new section and label visible. It also updates the visibility of the Back and Next buttons. It is important to update button visibility in both this and the Next function to ensure the navigation works properly in both directions.
Tests: 
In game, you are able to successfully switch between the three sections and see how the function updates the visibility of the next and back buttons.
'''


func _show_flavor(flavor_name):
	var flavors = ["Brown_Sugar", "Passionfruit", "Taro", "Oolong", "Matcha", "Strawberry", "Yakult", "Peach"]  
	for flavor in flavors:
		$DrinkContainer.get_node(flavor).visible = (flavor == flavor_name)
'''
Author: Rachel
Contract: String -> []
Description: Displays only the selected flavor by making the corresponding node visible and hiding all others.
Tests: 
In game, you are able to switch between flavors depending on which button you press.
'''

func _on_passionfruit_button_pressed():
	_show_flavor("Passionfruit")

func _on_taro_button_pressed():
	_show_flavor("Taro")

func _on_bs_button_pressed():
	_show_flavor("Brown_Sugar")
	
func _on_oolong_button_pressed():
	_show_flavor("Oolong")

func _on_matcha_button_pressed():
	_show_flavor("Matcha")

func _on_peach_button_pressed():
	_show_flavor("Peach")
	
func _on_strawberry_button_pressed():
	_show_flavor("Strawberry")

func _on_yakult_button_pressed():
	_show_flavor("Yakult")
'''
Author: Rachel
Contract: (button pressed) -> []
Description: Each function calls _show_flavor() depending on which button is being pressed, inputting their respective flavor names into the function.
Tests: 
In game, you are able to switch between flavors depending on which button you press.
'''

func _show_ice(ice_level):
	var levels = ["No_Ice", "Ice", "More_Ice"]  
	for level in levels:
		$DrinkContainer.get_node(level).visible = (level == ice_level)
'''
Author: Rachel
Contract: String -> []
Description: Displays only the selected ice level by making the corresponding node visible and hiding all others.
Tests: 
In game, you are able to switch between different ice levels depending on which button you press.
'''

func _on_ice_button_pressed():
	_show_ice("Ice")

func _on_no_ice_button_pressed():
	_show_ice("No_Ice")

func _on_more_ice_button_pressed():
	_show_ice("More_Ice")
'''
Author: Rachel
Contract: String -> []
Description: Each function calls _show_ice() depending on which button is being pressed, inputting their respective ice level names into the function.
Tests: 
In game, you are able to switch between different ice levels depending on which button you press.
'''

func _on_pearls_button_pressed():
	$DrinkContainer/Pearls.visible = !$DrinkContainer/Pearls.visible  

func _on_lychee_button_pressed():
	$DrinkContainer/Lychee_Jelly.visible = !$DrinkContainer/Lychee_Jelly.visible

func _on_sago_button_pressed():
	$DrinkContainer/Sago.visible = !$DrinkContainer/Sago.visible

func _on_grass_button_pressed():
	$DrinkContainer/Grass_Jelly.visible = !$DrinkContainer/Grass_Jelly.visible
'''
Author: Glynnis
Contract: (button pressed) -> []
Description: Each function updates the visibility of each topping once their respective buttons are pressed. Unlike the ice levels and the flavors, simply toggling the visibility allows the user to have more than one topping at a time.
Tests: 
In game, you are able to add and remove several toppings from your drink through clicking the different buttons.
'''
