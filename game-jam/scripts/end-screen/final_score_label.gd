extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_end_screen_final_score(score: int) -> void:
	if (score >= 0):
		self.text = """Shift Over!

You made a profit of %d gold pieces.""" % [score]
	
	else:
		self.text = """Shift Over!

You're Fired!

You lost the shop %d gold pieces.""" % [score * -1]
