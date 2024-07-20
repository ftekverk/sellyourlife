extends Node2D

@onready var windowSprite = $Sprite2D

# Season index enum
enum {WINTER, SPRING, SUMMER, FALL}

var seasons = ["winter", "spring", "summer", "fall"]
var current_season := ""

# Image file information
var seasonImages: Array = [
	preload("res://Art/Seasons/Winter_Season.png"),
	preload("res://Art/Seasons/Spring_Season.png"),
	preload("res://Art/Seasons/Summer_Season.png"),
	preload("res://Art/Seasons/Fall_Season.png")
]

# State variables
var currSeasonIdx: int = randi_range(0, len(seasonImages) - 1) 




func getNextSeason() -> void:
	print("index before incrementing: ", currSeasonIdx)
	currSeasonIdx = (currSeasonIdx + 1) % len(seasonImages)
	current_season = seasons[currSeasonIdx]
	print("index after incrementing: ", currSeasonIdx)

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready called (window)")
	var gameHandler = get_node("../GameHandler")
	gameHandler.connect("changeSeason", getNextSeason)
	current_season = seasons[currSeasonIdx]
	print("current season: ", current_season)

#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#getNextSeason()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	windowSprite.texture = seasonImages[currSeasonIdx]
