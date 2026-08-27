extends Node2D

var cursed: bool
var lying: bool
@export var item_name: String

# value is an int ranging from -X to Y
@export var value: int

# decides what page of the book governs it
enum ItemType {ORB, WAND, WEAPON, MISC}
var type: ItemType

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func load_item(index: int) -> void:
	var json = preload("res://resources/items.tres") as JSON
	#var error = json.parse(json)
	
	if typeof(json.data) == TYPE_ARRAY:
		
		var json_entry = json.data[index]
		
		item_name = json_entry["name"]
		
		# add sprite as child node
		var item_sprite = Sprite2D.new()
		item_sprite.texture = load("res://resources/sprites/items/"+item_name+".png") 
		add_child(item_sprite)
		
		# set parameters
		cursed = json_entry["cursed"]
		lying = json_entry["lying"]
		value = json_entry["value"]
		
		# set multiplier based on rarity
		#if json_entry["rarity"] == "common":
			#rarity = 1
		#elif json_entry["rarity"] == "uncommon":
			#rarity = 2
		#elif json_entry["rarity"] == "rare":
			#rarity = 5
		#elif json_entry["rarity"] == "legendary":
			#rarity = 10
		
		if json_entry["type"] == "weapon":
			type = ItemType.WEAPON
		elif json_entry["type"] == "wand":
			type = ItemType.WAND
		elif json_entry["type"] == "orb":
			type = ItemType.ORB
		elif json_entry["type"] == "misc":
			type = ItemType.MISC
	else:
		print("Unexpected data")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
