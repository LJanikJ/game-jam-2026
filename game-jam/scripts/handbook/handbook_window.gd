extends Window

var pages = [
	preload("res://resources/sprites/book/page1.png"),
	preload("res://resources/sprites/book/page2.png"),
	preload("res://resources/sprites/book/page3.png"),
	preload("res://resources/sprites/book/page4.png"),
	preload("res://resources/sprites/book/page5.png"),
	preload("res://resources/sprites/book/page6.png"),
	preload("res://resources/sprites/book/page7.png")
]

var index = 0

@onready var sprite = $PageSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_close_requested() -> void:
	hide()


func _on_page_left_pressed() -> void:
	if index > 0:
		index -= 1
		sprite.texture = pages[index]


func _on_page_right_pressed() -> void:
	if index < 6:
		index += 1
		sprite.texture = pages[index]
