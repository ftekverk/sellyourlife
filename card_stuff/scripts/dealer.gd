class_name Dealer

extends Node

@onready var hand = $"../BattleUI/Hand"
@onready var game_handler = $"../GameHandler"
@onready var window = $"../Window"


var starting_hand = [] as Array


var card_ui_scene := preload("res://card_stuff/card_UI/cardUI.tscn")

# Variables shared from hand
var cards_per_suit := 0
var hand_size := 0
var dealer_hand_size := 5
var base_card_path := ""


var player_hand := []

var dealer_hand_paths := []
var dealer_hand := []


# Called when the node enters the scene tree for the first time.
func _ready():
	
	cards_per_suit = hand.cards_per_suit
	hand_size = dealer_hand_size
	base_card_path = hand.base_card_path
	
	player_hand = hand.selected_cards
	#print("player hand: ", player_hand)
	
	game_handler.connect("removeDealerCard", remove_card_from_dealer_hand)
	
	generate_dealer_hand()


func choose_card_to_play(hand):
	
	var curr_season = window.current_season
	#print("current season in dealer, ", curr_season)
	
	print("dealer hand : ", hand)
	
	
#	Choose best card

#	Get cards from the current season
	var season_matched_cards = []
	for c in hand:
		print("C:", c.card.suit)
		var card_season = suit_to_season(c.card.suit)
		if card_season == curr_season:
			season_matched_cards.append(c)
		
#	If we have possible seasons, choose the best one of that season
	var max_card_val = 0
	var card_to_return
	if len(season_matched_cards) > 0:
		print("we have matching cards!")
		for c in season_matched_cards:
			if c.card.value > max_card_val:
				max_card_val = c.card.value
				card_to_return = c
		return card_to_return
		
	else:
#		Choose a random card from hand (hand[0])
#			- could do lowest from another season
		card_to_return = hand[0]
		

		return card_to_return



func generate_possible_cards_dealer() -> Array:
	
	var resource_paths = []
	for i in range(1, cards_per_suit + 1):
		for s in ["winter", "spring", "summer", "fall"]:
			resource_paths.append(base_card_path + s + "/"+ s + str(i) + ".tres")

	
	return resource_paths
	



func generate_dealer_hand() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var resource_paths := generate_possible_cards_dealer()

	while dealer_hand_paths.size() < hand_size:
		var random_index = rng.randi_range(0, resource_paths.size() - 1)
		var card_path = resource_paths[random_index]
		if card_path not in dealer_hand_paths:
			dealer_hand_paths.append(card_path)
	
#	Turn these paths into cardUI objects
	for card_path in dealer_hand_paths:
		var card_resource = load(card_path)
		if card_resource:
			var cardui_instance = card_ui_scene.instantiate()
			cardui_instance._set_card(card_resource)
			dealer_hand.append(cardui_instance)
#			Get these cards out of the way
			cardui_instance.position = Vector2(-1000, -1000) 
			
			add_child(cardui_instance)

		else:
			print("Failed to load card resource:", card_path)
	
	
	print("dealer hand: ", dealer_hand_paths)

	
	
func remove_card_from_dealer_hand(card):

	if card in dealer_hand:
		dealer_hand.erase(card)
		
	print(dealer_hand)
	



func suit_to_season(num):
	if num == 0:
		return "winter"
	if num == 1:
		return "spring"
	if num == 2:
		return "summer"
	if num == 3:
		return "fall"
	
	





