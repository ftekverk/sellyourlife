extends Node2D

# Summary : Handles game logic, comparing dealer card with player card

# Responsible for handling
#	- choose a dealer card
#	- determine if win

@onready var hand = $"../BattleUI/Hand"
@onready var dealer = $"../Dealer"


# Important variable
var dealer_hand := []
var dealer_hand_paths := []  # used for debugging
var player_hand := []


func _ready():
	
#	1.) Connect the card_played signal to handle_card_play
	if not hand or not dealer:
		return
		
	for CardUI in hand.get_children():
		var released_state = CardUI.get_node("CardStateMachine").get_node("CardReleasedState")
		released_state.connect("card_played", handle_card_play)

#	2.) Get important variables
	dealer_hand = dealer.dealer_hand
	dealer_hand_paths = dealer.dealer_hand_paths
	player_hand = hand.selected_cards
	


func handle_card_play(player_card_ui):
	print("handling card play!")

	var player_card = player_card_ui.card

	print("Played Card Value: ", player_card.value)
	print("Played Card Suit: ", player_card.suit)
	

#	1.) Get a card from the dealer and determine if win
	var dealer_card = dealer.choose_card_to_play(dealer_hand)
	
	print("dealer_card value: ", dealer_card.card.value)
	
	
	
	#print(dealer_card)
	#print("Played Card Value: ", dealer_card.card.value)





#	var dealer_card = generate_dealer_card()
#	var win = handle_card_game(card_ui.card, dealer_card)


#	2.) Handle betting
#	handle_betting()



func did_player_win(player_card, dealer_card) -> bool:
	return false


