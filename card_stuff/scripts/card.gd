class_name Card
extends Resource



enum Suit {WINTER, SPRING, SUMMER, FALL}


@export_group("Card Attributes")
@export var id: String
@export var suit: Suit
@export var value: int

@export_group("Card Visuals")
@export var icon: Texture
@export_multiline var tooltip_text: String
