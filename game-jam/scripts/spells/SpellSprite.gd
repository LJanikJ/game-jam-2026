extends Sprite2D

#var school : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_tabletop_view_new_item(_item_type: String, _item_name: String, magic_school : String) -> void:
	#school = magic_school
	
	texture = load("res://resources/sprites/sigil/"+magic_school+".png")


func _on_spell_1_pressed() -> void:
	# Start fully transparent
	modulate.a = 0.0
	visible = true
	
	# Create a tween to fade in over 1.0 second
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 3.0)


func _on_accept_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)


func _on_reject_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
