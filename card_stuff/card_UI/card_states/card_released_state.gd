extends CardState

@onready var cursor = get_tree().get_root().get_node("Game/Hand/Cursor")
var played: bool

signal card_played


func enter() -> void:
	#card_ui.color.color = Color.DARK_VIOLET
	#card_ui.state.text = "RELEASED"
	cursor.open_hand()
	
	played = false
	
#	if not empty, have valid target
	if not card_ui.targets.is_empty():
		played = true
		#print("play card for target(s) ", card_ui.targets)
	else:
		return
		
	card_played.emit(card_ui)






# Handles resetting the card if not played in proper area (has to be outside the
# enter function)
func on_input(_event: InputEvent) -> void:
	if played:
		return
		
#	if we haven't played, we dont have a valid target
	transition_requested.emit(self, CardState.State.BASE)
