extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#Fields
var name_label #a Label scene to display button name

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	#Random Color
	$AnimatedSprite.modulate = Color(randf(), randf(), randf())
	
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
	name_label.margin_top =  -16
	name_label.margin_left = 0
	add_child(name_label)
	
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
