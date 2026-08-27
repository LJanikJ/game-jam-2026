extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pressed() -> void:
	# I want this to open the pop-up window for the handbook
	# Need to create an instance of the handbook window? and then set to visible
	var window = get_child(0)
	window.popup()
	
	pass # Replace with function body.
	
