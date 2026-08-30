extends Node2D

@onready var lineCont = $CustomerCarrier
var customer_scene : PackedScene = preload("res://scenes/characters/customer.tscn")
var json = preload("res://resources/items.tres")

var spacing = 60

var queue = []
var next_up

signal customer_at_desk

# Ready will create the number of customers 
func _ready() -> void:
	for person in range(10):
		create_customer()
		
	#advance_line()
	
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
		
		for customer in queue:
			var tween = customer.create_tween()
			
			tween.tween_property(customer, "position", Vector2(customer.position.x + spacing,customer.position.y), 0.35)
			
			await get_tree().create_timer(0.2).timeout

func _on_accept_button_pressed() -> void:
	advance_line()


func _on_reject_button_pressed() -> void:
	advance_line()
	
func _on_customer_left(customer) -> void:
	lineCont.remove_child(customer)
	customer.queue_free()


func _on_customer_carrier_child_exiting_tree(node: Node) -> void:
	customer_at_desk.emit()


func _on_start_button_pressed() -> void:
	advance_line()
