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

# needs to pick up signal when one of the buttons is pressed
func remove_item() -> void:
	current_item.queue_free()
		
	if items.size() > 0:
		get_next_item()
	

func get_next_item() -> void:
	# get next item in queue and load instance, then slide in
	current_item = items.pop_front()
	
	$"Item Layer/ItemCarrier".add_child(current_item)
	
	$"Item Layer/AnimationPlayer".play("slide_in")


func _on_temp_button_pressed() -> void:
	if $"Item Layer/ItemCarrier".get_child_count() > 0:
		$"Item Layer/AnimationPlayer".play("slide_out")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "slide_out":
		remove_item()
