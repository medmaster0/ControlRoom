extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#FIELDS
var name_label
var delta_total = 0 #counter of total time since instancing

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	#Random color
	$Sprite.modulate = Color(randf(), randf(), randf())
	
	#Give a random name
	var valid_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
	var name = "" #The name of the button label ex. G123
	name = name + valid_characters[randi()%valid_characters.length()]
	name = name + valid_characters[randi()%valid_characters.length()]
	name = name + valid_characters[randi()%valid_characters.length()]
	name = name + valid_characters[randi()%valid_characters.length()]
	
	#Create the Label Scene
	name_label = Label.new()
	name_label.text = name
	name_label.margin_top =  -16 -8
	name_label.margin_left = 0 - 8
	add_child(name_label)
	
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	delta_total = delta_total + delta
	$Sprite.rotation = delta_total
	$Sprite2.rotation = delta_total
	
	pass
