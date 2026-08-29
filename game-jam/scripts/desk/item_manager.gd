extends Node2D

var items = []
var current_item
var score = 0
var num_cursed = 0
var magic_school : String
var num_processed = 0

signal items_empty
signal new_item
signal final_score
signal timer_start

# Ask is for a couple things regarding the items (functionally the same
# as the customers):
# - instead of ending the game at the end of the list, after 10 items end the game
# - have a timer for each item, decaying overall from 1 min to 45 sec over the 10 items
#   math: 60 - 45  = 15
#   15 sec off the time over 10 items
#   15/10 = 1.5 sec off the timer each time

var json = preload("res://resources/items.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# initialize with queue of items 
	# get list of items from json or something
	
	# get list of ints from 0 to n
	for index in range(json.data.size()):
		items.append(index)
	
	# shuffle and choose ten indexes
	items.shuffle()
	items = items.slice(0,10)
	
	# for each one in the list, read the corresponding JSON entry
	for index in range(10):
		var item = preload("res://scenes/item/item.tscn").instantiate()
		
		item.load_item(items[index])
		
		# swap out the int in the list for the item itself
		items[index] = item
		print(items[index], items[index].item_name)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# needs to pick up signal when one of the buttons is pressed
func remove_item() -> void:
	#$ItemTimer.stop()
	
	if current_item:
		current_item.queue_free()
		# Decaying timer, next customer has less time to process
		# than the last
		#$ItemTimer.start(60 - (num_processed * 1.5))
		
	# This is where we fire the signal to end the game
	# Limited to 10 items processed for some replayability
	if num_processed >= 10:
		items_empty.emit()
		final_score.emit(score)
	

func get_next_item() -> void:
	# get next item in queue and load instance, then slide in
	current_item = items.pop_front()
	magic_school = current_item.magic_school
	num_processed += 1
	
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


func _on_dialogue_label_hidden() -> void:
	var time = 30 + (3 * items.size())
	timer_start.emit(time)
