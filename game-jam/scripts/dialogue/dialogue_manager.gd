extends Node

var current_dialogue
var next_line: DialogueLine

@onready var dialogue_label = $"DialogueLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_dialogue = load("res://resources/dialogue/item_dialogue.dialogue")
	
	#next_line = await current_dialogue.get_next_dialogue_line("start")
	#
	#print_next_line()
	
	#dialogue_line = await resource.get_next_dialogue_line(dialogue_line.next_id)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func print_next_line() -> void:
	#dialogue_label.dialogue_line = next_line
	#
	#dialogue_label.type_out()
	#
	#next_line = await current_dialogue.get_next_dialogue_line(next_line.next_id)
	#
	#await get_tree().create_timer(2.5).timeout
#
	#if next_line:
		#print_next_line()
		#
	#else:
		#dialogue_label.visible = false


func _on_tabletop_view_new_item(item_name: String) -> void:
	dialogue_label.visible = true
	
	var item_dialogue = load("res://resources/dialogue/items/"+item_name+".dialogue")
	next_line = await item_dialogue.get_next_dialogue_line("start")
	
	while next_line:
		dialogue_label.dialogue_line = next_line
		dialogue_label.type_out()
		await get_tree().create_timer(2.5).timeout
		
		# CHANGE TO WAIT FOR USER TO DISMISS
		
		next_line = await current_dialogue.get_next_dialogue_line(next_line.next_id)
		
	dialogue_label.visible = false
