class_name Dealer

extends Node

@onready var hand = $"../BattleUI/Hand"

var starting_hand = [] as Array


# Variables shared from hand
var cards_per_suit := 0
var hand_size := 0
var base_card_path := ""

var player_hand := []

var dealer_hand := []



# Called when the node enters the scene tree for the first time.
func _ready():
	print("hand:", hand)
	
	cards_per_suit = hand.cards_per_suit
	hand_size = hand.hand_size
	base_card_path = hand.base_card_path
	
	player_hand = hand.selected_cards
	#print("player hand: ", player_hand)
	
	generate_dealer_hand()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func choose_card_to_play(hand):
	
	print("choosing dealer card")
	
	if len(hand) > 0:
		return hand[0]
	
	pass
	



func generate_possible_cards_dealer() -> Array:
	
	var resource_paths = []
	for i in range(1, cards_per_suit + 1):
		for s in ["winter", "spring", "summer", "fall"]:
			resource_paths.append(base_card_path + s + "/"+ s + str(i) + ".tres")
	
	#print(resource_paths)
	
	return resource_paths
	



func generate_dealer_hand() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var resource_paths := generate_possible_cards_dealer()

	while dealer_hand.size() < hand_size:
		var random_index = rng.randi_range(0, resource_paths.size() - 1)
		var card_path = resource_paths[random_index]
		if card_path not in dealer_hand:
			dealer_hand.append(card_path)
	
	print("dealer hand: ", dealer_hand)

	
