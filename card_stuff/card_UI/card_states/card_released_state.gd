extends CardState


var played: bool

signal card_played

@onready var game_handler = $GameHandler



func enter() -> void:

	played = false
	
#	if not empty, have valid target
	if not card_ui.targets.is_empty():
		played = true
	else:
		return
		
#	Get attributes of played card
	print("Played Card Value: ", card_ui.card.value)
	print("Played Card Suit: ", card_ui.card.suit)

	print("emitting card played")
	card_played.emit()
	
#	Generate a signal to the game handler that a card has been played




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
