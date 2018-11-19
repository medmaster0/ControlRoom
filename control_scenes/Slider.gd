extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#FIELDS
var name_label
#slider movement
var slide_velocity = 0 #vector of slider velocity (per second)
var slide_position = 0 #the position of the slider slide -> 0 is center
var slide_bounds = 21 #The absolute value of the slider bounds

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	#set color
	$Slide.modulate = Color(randf(), randf(), randf())
	
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
	name_label.margin_top =  -16 -8 -8
	name_label.margin_left = 0 - 8
	add_child(name_label)
	
	#random velocity
	slide_velocity = 5 + randi()%10
	
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	#Calculate new position
	slide_position = slide_position + slide_velocity * delta
	
	#bounds check
	if abs(slide_position) >= slide_bounds:
		#go the other way (reverse velocity)
		slide_velocity = slide_velocity * -1
	
	#set posiiton of slide
	$Slide.position.x = slide_position
	
	
	pass
