extends Node2D

# Season index enum
enum {WINTER, SPRING, SUMMER, FALL}

# Image file information
#var seasonsBasePath: String = "res://Art/Seasons/"
var seasonImages: Array = [
	preload("res://Art/Seasons/Winter_Season.png"),
	preload("res://Art/Seasons/Spring_Season.png"),
	preload("res://Art/Seasons/Summer_Season.png"),
	preload("res://Art/Seasons/Fall_Season.png"),
]
#var seasonsInfo: Array[Dictionary] = [
	#{
		#name: "Winter",
		#filename: "Winter_Season.png",
	#},
	#{
		#name: "Spring",
		#filename: "Spring_Season.png"
	#},
	#{
		#name: "Summer",
		#filename: "Summer_Season.png"
	#},
	#{
		#name: "Fall",
		#filename: "Fall_Season.png"
	#}
#]

# State variables
var currSeasonIdx: int = randi_range(0, len(seasonImages) - 1)

func getNextSeason() -> void:
	currSeasonIdx = (currSeasonIdx + 1) % len(seasonImages)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		getNextSeason()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2D.texture = seasonImages[currSeasonIdx]
