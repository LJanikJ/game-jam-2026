extends Node2D

var cursed: bool
var lying: bool
@export var item_name: String

# value is an int ranging from -X to Y
@export var value: int

# decides what page of the book governs it
var type: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func load_item(index: int) -> void:
	var json = preload("res://resources/items.tres") as JSON
	#var error = json.parse(json)
	
	if typeof(json.data) == TYPE_ARRAY:
		
		var json_entry = json.data[index]
		
		item_name = json_entry["name"]
		type = json_entry["type"]
		
		# add sprite as child node
		var item_sprite = Sprite2D.new()
		item_sprite.texture = load("res://resources/sprites/items/"+type+"/"+item_name+".png")
		item_sprite.scale.x = 8.0
		item_sprite.scale.y = 8.0
		
		add_child(item_sprite)
		
		# set parameters
		cursed = json_entry["cursed"]
		lying = json_entry["lying"]
		value = json_entry["value"]
	else:
		print("Unexpected data")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
