extends Node2D

@onready var lineCont = $CustomerCarrier
@export var customer_scene : PackedScene = preload("res://scenes/characters/customer.tscn")

var spacing = 60

var queue = []
var next_up

signal customer_at_desk

# Ready will create the number of customers 
func _ready() -> void:
	for person in range(12):
		create_customer()
		
	advance_line()
	
func create_customer() -> void:
	var customer = customer_scene.instantiate()
	
	queue.append(customer)
	
	# randomize x,y position of sprite a little bit
	var staggerX = randi_range(-5,5)
	var staggerY = randi_range(1,6)
	customer.get_child(0).position.x += staggerX
	customer.get_child(0).position.y += staggerY

	lineCont.add_child(customer)
	customer.off_screen.connect(_on_customer_left)
	
	customer.position.x -= spacing * queue.size()



func advance_line() -> void: 
	if queue.size() > 0:
		# first in array, play move off-screen animation
		next_up = queue.pop_front()
		next_up.is_walking = true
		await get_tree().create_timer(0.2).timeout
		
		# control all other customers in line
		var threads = []
		
		for customer in queue:
			threads.append(Thread.new())
		
		for customer in queue:
			var thread: Thread = Thread.new()
			
			thread.start(shift_forward.bind(customer))
			
			await get_tree().create_timer(0.2).timeout
			
		for thread in threads:
			thread.wait_to_finish()

func shift_forward(customer) -> void:
	customer.is_walking = true
	
	for i in range(spacing):
		await get_tree().process_frame
		
	customer.is_walking = false

func _on_accept_button_pressed() -> void:
	advance_line()


func _on_reject_button_pressed() -> void:
	advance_line()
	
func _on_customer_left(customer) -> void:
	print("Freeing " + str(customer))
	lineCont.remove_child(customer)
	customer.queue_free()


func _on_customer_carrier_child_exiting_tree(node: Node) -> void:
	customer_at_desk.emit()
