extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (PackedScene) var Creature

##GLOBAL VARS
##------
var background_color
var workers = [] # a list of "Creatures" that will do the pressing of buttons and shit

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	#Set up background
	background_color = Color(randf(), randf(), randf())
	$CanvasLayer/Background.scale = get_viewport().size
	$CanvasLayer/Background.set_modulate( background_color )
	
	#This modulation change doesn't happen to pre-placed tiles (from viewer GUI)
	$TileMap.self_modulate = MedAlgo.contrastColor(background_color)
	
	#Generate Paths to controls...
	gen_control_paths() #a cool function to set all of the tiles in a path
	
	#Need to go into all children
	#And if they have a name_label, then need to change the color
	for child in get_children():
		#if child.name_label != null:
		if "name_label" in child:
			var change_color = MedAlgo.contrastColor(background_color)
			child.name_label.modulate = change_color
	
	#Generate workers 
	var num_workers = 5
	for i in range(num_workers):
		var temp_worker = Creature.instance()
		temp_worker.position = Vector2(500+(i*32),125 ) 
		$TileMap.add_child(temp_worker)
		print(i)
		
	
	#print($TileMap.find_path($Button.position, $TileMap.get_child(1).position  ))
	#END of READY

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

#a cool function to set all of the tiles in a path
func gen_control_paths():
	#$TileMap.set_cellv($TileMap.world_to_map($Slider.position), 1)
	
	#Good time to set all of the control positions...
	set_control_position()
	
	#Path t0 buttons
	var cell_coords #a temp var that goes through each cell we are going to set
	cell_coords = $TileMap.world_to_map($Button.position)
	for i in range(20):
		var new_cell = cell_coords + Vector2(i,0)
		$TileMap.set_cellv(new_cell,1)
		
	#Path to knobs
	cell_coords = $TileMap.world_to_map($Knob.position)
	for i in range(20):
		var new_cell = cell_coords + Vector2(i,1)
		$TileMap.set_cellv(new_cell,1)
		
	#Path to sliders
	cell_coords = $TileMap.world_to_map($Slider.position)
	for i in range(20):
		var new_cell = cell_coords + Vector2(i,1)
		$TileMap.set_cellv(new_cell,1)
	
	#Path to keypad
	cell_coords = $TileMap.world_to_map($Keypad.position)
	for i in range(20):
		var new_cell = cell_coords + Vector2(i,1)
		$TileMap.set_cellv(new_cell,1)
	
	
func set_control_position():
	$Button.position = $TileMap.map_to_world(Vector2(3,3))
	$Button2.position = $TileMap.map_to_world(Vector2(7,3))
	$Button3.position = $TileMap.map_to_world(Vector2(11,3))
	
	$Knob.position = $TileMap.map_to_world(Vector2(3,7))
	$Knob2.position = $TileMap.map_to_world(Vector2(7,7))
	$Knob3.position = $TileMap.map_to_world(Vector2(11,7))
	
	$Slider.position = $TileMap.map_to_world(Vector2(3,11))
	$Slider2.position = $TileMap.map_to_world(Vector2(7,11))
	$Slider3.position = $TileMap.map_to_world(Vector2(11,11))
	
	$Keypad.position = $TileMap.map_to_world(Vector2(3,15))
	$Keypad2.position = $TileMap.map_to_world(Vector2(7,15))
	$Keypad3.position = $TileMap.map_to_world(Vector2(11,15))