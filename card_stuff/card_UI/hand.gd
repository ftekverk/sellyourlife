class_name Hand

extends HBoxContainer


# Generate starting hand
var base_card_path := "res://card_stuff/card_objects/"
var cards_per_suit := 3
var hand_size := 3

var card_ui_scene := preload("res://card_stuff/card_UI/cardUI.tscn")
var card_scene := preload("res://card_stuff/card_UI/cardUI.tscn")

# Starting hand
var selected_cards = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
#	Set a random set of 5 cards as children of player hand
	generate_starting_hand()
	
	for child in get_children():
		var card_ui := child as CardUI
		card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)


func _on_card_ui_reparent_requested(child: CardUI) -> void:
	child.reparent(self)


func generate_possible_cards() -> Array:
	
	var resource_paths = []
	for i in range(1, cards_per_suit + 1):
		for s in ["winter", "spring", "summer", "fall"]:
			resource_paths.append(base_card_path + s + "/"+ s + str(i) + ".tres")
	
	#print(resource_paths)
	
	return resource_paths


func generate_starting_hand() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var resource_paths := generate_possible_cards()

	while selected_cards.size() < hand_size:
		var random_index = rng.randi_range(0, resource_paths.size() - 1)
		var card_path = resource_paths[random_index]
		if card_path not in selected_cards:
			selected_cards.append(card_path)
	
	for card_path in selected_cards:
		var card_resource = load(card_path)
		if card_resource:
			pass
			var cardui_instance = card_ui_scene.instantiate()
			cardui_instance._set_card(card_resource)
			#card_instance._set_card()
			add_child(cardui_instance)
		else:
			print("Failed to load card resource:", card_path)

	#print("selected cards: ", selected_cards)

	pass
	

func quick_test():
	print("here in hand")
