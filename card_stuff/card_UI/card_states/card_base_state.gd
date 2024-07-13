extends CardState


func enter() -> void:
	
#Base state is below cardUI
#	- children get ready first, so instead need to wait for cardUI to be ready
	if not card_ui.is_node_ready():
		await card_ui.ready

	card_ui.reparent_requested.emit(card_ui)

	card_ui.panel.set("theme_override_styles/panel", card_ui.BASE_STYLEBOX)
	
#	Drag from where you clicked on the card
	card_ui.pivot_offset = Vector2.ZERO
	
	
func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		print("Left mouse event!!")
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		transition_requested.emit(self, CardState.State.CLICKED)


func on_mouse_entered() -> void:
	card_ui.panel.set("theme_override_styles/panel", card_ui.HOVER_STYLEBOX)
	
func on_mouse_exited() -> void:
	card_ui.panel.set("theme_override_styles/panel", card_ui.BASE_STYLEBOX)
