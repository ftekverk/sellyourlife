extends Sprite2D
var closed_left = preload("res://Cursor Stuff/Art/hand_closed_left.png")
var closed_right = preload("res://Cursor Stuff/Art/hand_closed_right.png")
var right = preload("res://Cursor Stuff/Art/hand_open.png")
var left = preload("res://Cursor Stuff/Art/hand_open_left.png")
var isRight = false
var currState = "open"

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	texture = right
	pass # Replace with function body.
	
func _process(delta):
	if position.x > get_viewport_rect().size.x / 2:
		isRight = true
	else:
		isRight = false
	position = get_global_mouse_position()
	update_state()
	pass

func update_state():
	if isRight:
		if currState == "open":
			texture = right
		else:
			texture = closed_right
	else:
		if currState == "open":
			texture = left
		else:
			texture = closed_left
	pass

func open_hand():
	currState = "open"
	
func close_hand():
	currState = "closed"
