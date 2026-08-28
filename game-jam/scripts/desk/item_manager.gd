extends Node2D

var items = []
var current_item
var score = 0
var num_cursed = 0
var magic_school : String

signal items_empty
signal new_item
signal final_score

var json = preload("res://resources/items.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# initialize with queue of items 
	# get list of items from json or something
	
	# potentially limit the size of the array so that not every item appears in a single run
	for index in range(json.data.size()):
		var item = preload("res://scenes/item/item.tscn").instantiate()
		
		item.load_item(index)
		items.append(item)
	
	items.shuffle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# needs to pick up signal when one of the buttons is pressed
func remove_item() -> void:
	if current_item:
		current_item.queue_free()
		
	if items.size() == 0:
		items_empty.emit()
		final_score.emit(score)
	

func get_next_item() -> void:
	# get next item in queue and load instance, then slide in
	current_item = items.pop_front()
	magic_school = current_item.magic_school
	
	
	$"Item Layer/ItemCarrier".add_child(current_item)
	$"Item Layer/AnimationPlayer".play("slide_in")
		
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "slide_out":
		remove_item()

# On reject we agreed that nothing happens to the score
func _on_reject_button_pressed() -> void:
	if $"Item Layer/ItemCarrier".get_child_count() > 0:
		$"Item Layer/AnimationPlayer".play("slide_out")

# On accepting any item we need to process the change to the score and
# update the relevant statistics
func _on_accept_button_pressed() -> void:
	if $"Item Layer/ItemCarrier".get_child_count() > 0:
		$"Item Layer/AnimationPlayer".play("slide_out")
		
		score += current_item.value
		if current_item.cursed:
			num_cursed += 1


func _on_animation_player_animation_started(anim_name: StringName) -> void:
	if anim_name == "slide_in":
		new_item.emit(current_item.type, current_item.item_name, current_item.magic_school)



func _on_shop_view_customer_at_desk() -> void:
	if items.size() > 0:
		get_next_item()
