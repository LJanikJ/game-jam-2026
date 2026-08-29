extends TextureProgressBar

@onready var timer: Timer = $Timer

var current_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if timer.get_time_left():
		value = max_value - timer.get_time_left()
	else:
		value = 0

func _on_tabletop_view_timer_start(time: int) -> void:
	max_value = time
	value = 0
	
	timer.start(time)

	# make it so that it goes +1 per second


func _on_reject_button_pressed() -> void:
	timer.stop()


func _on_accept_button_pressed() -> void:
	timer.stop()
