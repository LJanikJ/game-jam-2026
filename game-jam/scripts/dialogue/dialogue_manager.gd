extends Node

#var current_dialogue
var next_line: DialogueLine

var current_dialogue

enum DialogueType {TUTORIAL, ITEM, OTHER}
var dType: DialogueType

@onready var dialogue_label = $"DialogueLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dType = DialogueType.OTHER


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
	dType = DialogueType.ITEM
	
	current_dialogue = load("res://resources/dialogue/items/"+item_name+".dialogue")
	
	if current_dialogue:
		next_line = await current_dialogue.get_next_dialogue_line("start")
		
		if next_line:
			dialogue_label.dialogue_line = next_line
			dialogue_label.type_out()
	
	#while next_line:
		#dialogue_label.dialogue_line = next_line
		#dialogue_label.type_out()
		#
		#if current_dialogue:
			#next_line = await current_dialogue.get_next_dialogue_line(next_line.next_id)
		#
		#await get_tree().create_timer(0.1).timeout
		#
		## CHANGE TO WAIT FOR USER TO DISMISS
		#
	#dialogue_label.visible = false


func _on_dialogue_label_finished_typing() -> void:
	await get_tree().create_timer(1.5).timeout
	
	if current_dialogue and dType == DialogueType.ITEM:
		next_line = await current_dialogue.get_next_dialogue_line(next_line.next_id)
		
		if next_line:
			dialogue_label.dialogue_line = next_line
			dialogue_label.type_out()
		else:
			dialogue_label.visible = false
