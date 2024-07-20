extends Node
@onready var eye = get_tree().get_root().get_node("Game/Table/Shelf/Eye")
@onready var foot = get_tree().get_root().get_node("Game/Table/Shelf/Foot")
@onready var rgb = get_tree().get_root().get_node("Game/Table/Shelf/RGB")

var foot_art = preload("res://Shelf/Art/foot.png")
var eye_art = preload("res://Shelf/Art/eye.png")
var rgb_art = preload("res://Shelf/Art/rgb.png")
var blank = preload("res://Shelf/blank_pixel.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	eye.texture = blank
	foot.texture = blank
	rgb.texture = blank
	pass # Replace with function body.

func eye_control(isOn):
	if isOn:
		eye.texture = eye_art
	else:
		eye.texture = blank

func foot_control(isOn):
	if isOn:
		foot.texture = foot_art
	else:
		foot.texture = blank

func rgb_control(isOn):
	if isOn:
		rgb.texture = rgb_art
	else:
		rgb.texture = blank
