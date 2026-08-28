extends Area2D

var dull = preload("res://resources/sound_effects/glass/dull.wav")
var sharp = preload("res://resources/sound_effects/glass/sharp.wav")

@onready var ccc = $ClickCheckCollider
@onready var audio = $ClickPlayer

# Item property variable declaration 
var cursed: bool
var lying: bool
@export var item_name: String
@export var magic_school: String 

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
		magic_school = json_entry["magic_school"]
		
	else:
		print("Unexpected data")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_click() -> void:
	# currently set to weaponfor testing
	if type == "weapon":
		if lying:
			audio.stream = dull
			# dull sound effect
		else:
			audio.stream = sharp
			# sharp sound effect
		
		audio.play()
	elif type == "orb":
		pass
	elif type == "staff":
		pass
	else:
		pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		self.on_click()

 
