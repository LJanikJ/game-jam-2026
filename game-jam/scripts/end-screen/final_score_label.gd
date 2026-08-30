extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_end_screen_final_score(score: int, num_bad: int) -> void:
	if score >= 0:
		if num_bad == 0:
			self.text = """Shift Over!

You made a profit of %d gold pieces.

[rainbow]You did perfectly![/rainbow]""" % [score, num_bad]
		else:
			self.text = """Shift Over!

You made a profit of %d gold pieces.

You made %d wrong choices.""" % [score, num_bad]
	
	
	
	
	else:
		if num_bad == 10:
			self.text = """You did absolutely abysmal!

You're [shake]Fired[/shake]!

You lost the shop %d gold pieces.

You didn't make a single right choice...""" % [score * -1]
		else:
			self.text = """Shift Over!

You're [shake]Fired[/shake]!

You lost the shop %d gold pieces.

You made %d wrong choices.""" % [score * -1, num_bad]
