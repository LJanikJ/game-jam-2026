extends Node2D

@onready var lineCont = $CustomerContainer
@export var customer_scene : PackedScene = preload("res://scenes/characters/customer.tscn")

# Ready will create the number of customers 
func _ready() -> void:
	for person in range(20):
		create_customer()
	
func create_customer() -> void:
	var customer = customer_scene.instantiate()
	
	# randomize x,y position a little bit
	var staggerX = randi_range(-5,5)
	var staggerY = randi_range(1,6)
	
	customer.get_child(0).position.x += staggerX
	customer.get_child(0).position.y += staggerY

	lineCont.add_child(customer)

#func advance_line() -> void: 
	

# making it move...
# queue of customers, keep track of which one is first
# would require us to get rid of CustomerContainer, code positions ourselves
# when button pressed, shift first customer offscreen and all others one spot right
# could even stagger animations, wouldn't be too hard i think
