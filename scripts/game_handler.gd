extends Node2D

# Summary : Handles game logic, comparing dealer card with player card

# Responsible for handling
#	- choose a dealer card
#	- determine if win

@onready var hand = $"../BattleUI/Hand"
@onready var dealer = $"../Dealer"
@onready var window = $"../Window"
@onready var dealer_drop_location = $"../DealerDropLocation"

# Signals
signal changeSeason
signal removeDealerCard

# Important variable
var dealer_hand := []
var dealer_hand_paths := []  # used for debugging
var player_hand := []



func _ready():
	print("ready called (game handler)")
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
		
	#dealer_card.panel.z_index = 10
	dealer_card.position = dealer_drop_location.position
	
		
	
	await get_tree().create_timer(3).timeout
	dealer_card.position = Vector2(1000, 1000)
	
	#dealer_card.reparent(dealer_drop_location)
	#print("reparented to: ", dealer_drop_location)
	
	#dealer_card.postion = Vector2(300, 300) 
	print("dealer_card value: ", dealer_card.card.value)
	
	
	
	
#	2.) Determine if win
	if did_player_win(player_card, dealer_card):
		print("player won!")
	else:
		print("player lost")
	
	
	
#	3.) Remove dealer card
	removeDealerCard.emit(dealer_card)
	
	
#	3.) Handle Betting



#	4.) Change Season
	print("Emitting season")
	changeSeason.emit()









func did_player_win(player_card, dealer_card) -> bool:
	
	dealer_card = dealer_card.card
	var curr_season_idx = window.currSeasonIdx
	
	var is_dealer_trump = curr_season_idx == dealer_card.suit
	var is_player_trump = curr_season_idx == player_card.suit
	
	if is_dealer_trump and not is_player_trump:
		return false
	if is_player_trump and not is_dealer_trump:
		return true
		
#	Neither is trump
	else:
		return player_card.value > dealer_card.value
	




