class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)


@export var card: Card : set = _set_card
@export var card_resource: Resource

# Card variables
@onready var drop_point_detector = $DropPointDetector
@onready var targets: Array[Node] = []

# Card Visuals
@onready var panel = $Panel
@onready var icon = $Icon


# Setup state machine
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine

# Styles
const BASE_STYLEBOX := preload("res://card_stuff/card_UI/card_base_stylebox.tres")
const DRAG_STYLEBOX := preload("res://card_stuff/card_UI/card_dragging_stylebox.tres")
const HOVER_STYLEBOX := preload("res://card_stuff/card_UI/card_hover_stylebox.tres")


func _ready() -> void:
	card_state_machine.init(self)

# Callback functions
func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)


func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)

	
	
func _set_card(value: Card) -> void:
	if not is_node_ready():
		await ready
		
	card = value
	icon.texture = card.icon
	pass
