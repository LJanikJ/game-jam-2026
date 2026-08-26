extends Node2D

@onready var lineCont = $HBoxContainer
@export var customer_scene : PackedScene = preload("res://scenes/characters/customer.tscn")

# Ready will create the number of customers 
func _ready() -> void:
	for person in range(24):
		create_customer()
	
func create_customer() -> void:
	var customer = customer_scene.instantiate()
	
	
	lineCont.add_child(customer)

#func advance_line() -> void: 
	
