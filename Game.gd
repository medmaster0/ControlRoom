extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

##GLOBAL VARS
##------
var background_color

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	#Set up background
	background_color = Color(randf(), randf(), randf())
	$CanvasLayer/Background.scale = get_viewport().size
	$CanvasLayer/Background.set_modulate( background_color )
	
	#Need to go into all children
	#And if they have a name_label, they need to change the color
	for child in get_children():
		#if child.name_label != null:
		if "name_label" in child:
			var change_color = MedAlgo.contrastColor(background_color)
			print(change_color)
			child.name_label.modulate = change_color
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
