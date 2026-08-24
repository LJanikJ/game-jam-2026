extends Node2D

var items = []
var current_item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# initialize with queue of items 
	# get list of items from json or something
	
	# change range to be number of items
	for index in range(3):
		var item = preload("res://scenes/item/item.tscn").instantiate()
		
		item.load_item(index)
		items.append(item)
	
	items.shuffle()
	
	get_next_item()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func remove_item() -> void:
	#slide
	current_item.velocity.x = 5
	
	#
	
	# after user makes decision, slide item off table and remove instance
	pass

func get_next_item() -> void:
	# get next item in queue and load instance, then slide in
	current_item = items.pop_front()
	
	current_item.position.x = 300
	current_item.position.y = 300
	
	pass
