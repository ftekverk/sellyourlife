extends Node2D

# Summary : Handles game logic, comparing dealer card with player card

# Responsible for handling
#	- choose a dealer card
#	- determine if win

@onready var hand = $"../BattleUI/Hand"
@onready var dealer = $"../Dealer"


# Important variable
var dealer_hand := []
var player_hand := []


func _ready():
	
#	1.) Connect the card_played signal to handle_card_play
	for CardUI in hand.get_children():
		var released_state = CardUI.get_node("CardStateMachine").get_node("CardReleasedState")
		released_state.connect("card_played", handle_card_play)

#	2.) Get important variables
	dealer_hand = dealer.dealer_hand
	#player_hand = hand.


func handle_card_play():
	print("handling card play!")
	
#	Choose dealer card


#	Check if player won


func did_player_win(player_card, dealer_card) -> bool:
	return false


