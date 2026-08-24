extends Node2D

var cursed: bool
var lying: bool


# common = 1, uncommon = 2, rare = 5, legendary = 10
var rarity: int

# quality is an int ranging from 0 to X
var quality: int

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
		
		cursed = json_entry["cursed"]
		lying = json_entry["lying"]
		quality = json_entry["quality"]
		
		if json_entry["rarity"] == "common":
			rarity = 1
		elif json_entry["rarity"] == "uncommon":
			rarity = 2
		elif json_entry["rarity"] == "rare":
			rarity = 5
		elif json_entry["rarity"] == "legendary":
			rarity = 10
		
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
func _process(delta: float) -> void:
	pass

# placeholder value calc
func get_value() -> int:
	var baseValue = 0
	
	if cursed or lying:
		return 0
	
	if type == ItemType.ORB:
		baseValue = 100
	elif type == ItemType.WAND:
		baseValue = 100
	elif type == ItemType.WEAPON:
		baseValue = 100
	elif type == ItemType.MISC:
		baseValue = 100
		
	return baseValue * rarity * quality
