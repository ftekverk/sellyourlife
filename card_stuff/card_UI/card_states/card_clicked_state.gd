extends CardState
@onready var cursor = get_tree().get_root().get_node("Game/HandCursor/Cursor")

func enter() -> void:
	#card_ui.color.color = Color.ORANGE
	#card_ui.state.text = "CLICKED"
#	Enable monitoring because we are beginning to interact with card

	if cursor:
		cursor.close_hand()
	card_ui.drop_point_detector.monitoring = true


func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.DRAGGING)
