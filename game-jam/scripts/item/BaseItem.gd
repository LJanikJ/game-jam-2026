extends Node2D

var cursed
var lying

# decides what page of the book governs it
var type

# common = 1, uncommon = 2, rare = 5, legendary = 10
var rarity

# quality is an int ranging from 0 to X
var quality

enum ItemType {ORB, STAFF, WEAPON, MISC}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
	elif type == ItemType.STAFF:
		baseValue = 100
	elif type == ItemType.WEAPON:
		baseValue = 100
	elif type == ItemType.MISC:
		baseValue = 100
		
	return baseValue * rarity * quality
