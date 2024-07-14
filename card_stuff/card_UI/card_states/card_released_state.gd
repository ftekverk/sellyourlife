extends CardState


var played: bool

signal card_played



func enter() -> void:

	played = false
	
#	if not empty, have valid target
	if not card_ui.targets.is_empty():
		played = true
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
