extends CardState


var played: bool


func enter() -> void:
	#card_ui.color.color = Color.DARK_VIOLET
	#card_ui.state.text = "RELEASED"

	played = false
	
#	if not empty, have valid target
	if not card_ui.targets.is_empty():
		played = true
		#print("play card for target(s) ", card_ui.targets)
	else:
		return
		
#	Get attributes of played card
	print("Played Card Value: ", card_ui.card.value)
	print("Played Card Suit: ", card_ui.card.suit)

#	1.) Get a card from the dealer and determine if win
#	var dealer_card = generate_dealer_card()
#	var win = handle_card_game(card_ui.card, dealer_card)

#	2.) Handle betting
#	handle_betting()






# Handles resetting the card if not played in proper area (has to be outside the
# enter function)
func on_input(_event: InputEvent) -> void:
	if played:
		return
		
#	if we haven't played, we dont have a valid target
	transition_requested.emit(self, CardState.State.BASE)
