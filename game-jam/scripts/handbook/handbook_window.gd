extends Window

signal flip_sound

var index = 0

@onready var page1 = $PageSprite1
@onready var page2 = $PageSprite2
@onready var page3 = $PageSprite3
@onready var page4 = $PageSprite4
@onready var page5 = $PageSprite5
@onready var page6 = $PageSprite6
@onready var page7 = $PageSprite7

@onready var pages = [
	page1,
	page2,
	page3,
	page4,
	page5,
	page6,
	page7
]

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
		pages[index].visible = false
		index -= 1
		pages[index].visible = true
		flip_sound.emit()
		
		if index == 0:
			$PageFlipLeft.visible = false


func _on_page_right_pressed() -> void:
	if index < 6:
		pages[index].visible = false
		index += 1
		pages[index].visible = true
		flip_sound.emit()
		
		if index == 6:
			$PageFlipRight.visible = false

func _on_page_left_mouse_entered() -> void:
	if index > 0:
		$PageFlipLeft.visible = true


func _on_page_left_mouse_exited() -> void:
	$PageFlipLeft.visible = false


func _on_page_right_mouse_entered() -> void:
	if index < 6:
		$PageFlipRight.visible = true


func _on_page_right_mouse_exited() -> void:
	$PageFlipRight.visible = false
