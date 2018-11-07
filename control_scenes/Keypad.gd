extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#FIELDS
var name_label
var total_delta = 0 #Will keep track of total accumulated time

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	$Frame.modulate = Color(randf(), randf(), randf())
	$Keys.modulate = Color(randf(), randf(), randf())
	
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
	
	total_delta = total_delta + delta
	
	#Every quarter second, toggle a arandom key
	if total_delta > 0.25:
		
		#Pick a random key
		var choice = 1 + randi() % 9 
		match choice:
			1:
				$Keys/key1.visible = !$Keys/key1.visible #toggle
			2:
				$Keys/key2.visible = !$Keys/key2.visible #toggle
			3:
				$Keys/key3.visible = !$Keys/key3.visible #toggle
			4:
				$Keys/key4.visible = !$Keys/key4.visible #toggle
			5:
				$Keys/key5.visible = !$Keys/key5.visible #toggle
			6:
				$Keys/key6.visible = !$Keys/key6.visible #toggle
			7:
				$Keys/key7.visible = !$Keys/key7.visible #toggle
			8:
				$Keys/key8.visible = !$Keys/key8.visible #toggle
			9:
				$Keys/key9.visible = !$Keys/key9.visible #toggle
		
		
		total_delta = total_delta - 0.25 #decrement from count
	
	pass
