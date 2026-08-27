extends Node2D

@onready var sprite = $Sprite2D

signal off_screen

var WALKING_SPEED = 1

@export var is_walking: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	is_walking = false
	sprite.frame = randi_range(0, 7)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_walking:
		position.x += 1

	if position.x > 150:
		off_screen.emit(self)
