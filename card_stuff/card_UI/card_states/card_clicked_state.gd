extends CardState



func enter() -> void:
	card_ui.color.color = Color.ORANGE
	card_ui.state.text = "CLICKED"
	
#	Enable monitoring because we are beginning to interact with card
	card_ui.drop_point_detector.monitoring = true


func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.DRAGGING)
