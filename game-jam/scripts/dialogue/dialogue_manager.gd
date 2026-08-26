extends Node

var resource
var next_line: DialogueLine

@onready var dialogue_label = $"DialogueLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resource = load("res://resources/dialogue/item_dialogue.dialogue")
	
	next_line = await resource.get_next_dialogue_line("start")
	
	print_next_line()
	
	#dialogue_line = await resource.get_next_dialogue_line(dialogue_line.next_id)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func print_next_line() -> void:
	dialogue_label.dialogue_line = next_line
	
	dialogue_label.type_out()
	
	next_line = await resource.get_next_dialogue_line(next_line.next_id)
	
	await get_tree().create_timer(2.5).timeout

	if next_line:
		print_next_line()
		
	else:
		dialogue_label.visible = false
