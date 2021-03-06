extends Node2D

export (PackedScene) var Coin
export (PackedScene) var ZodiacTile

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var map = get_parent()

#GENERAL VARS??
var zodiac_sign = randi()%12
var zodiac_tile
#var zodiac_background #children, not vars
var creature_name = ""

var path = [] #A set of steps to follow in pathfinding
#path is in MAP COORDS
#------
var total_delta = 0 #used as a counter in process loop

var is_main = false #Used to specify which Creature is the "Leader"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	#Make a random color
	$Sprite2.set_modulate( Color(randf(), randf(), randf()) )
	
	#Enable user input
	set_process_input( true )

#	#zodiac tile
#	zodiac_tile = ZodiacTile.instance()
#	zodiac_tile.position.x = zodiac_tile.position.x - map.cell_size.x
#	zodiac_tile.get_child(zodiac_sign).visible = true
#	add_child(zodiac_tile)
#	#zodiac_tile.visible = false
#	#set zodiac contrast color
#	zodiac_tile.modulate = MedAlgo.contrastColor(map.self_modulate)
#
#	#zodiacl background (set colors)
#	$ZodiacBackground.modulate = map.self_modulate
#	#$ZodiacBackground.visible = false

	creature_name = Story.generateName()
	

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	total_delta = total_delta + delta
	
	var time_period = 0.5
	
	if total_delta > time_period:
		
		#Take a step in the path
		path_step()
			
		total_delta = total_delta - time_period
	
	pass


# Get our position in Map Coordinates
func get_map_pos():
	return map.world_to_map( global_position )

# Set our position to Map Coordinates
func set_map_pos( cell ):
	position = map.map_to_world( cell ) 

#Check if a tile is a floor (in the parent TIleMap)
func is_floor(cell):
	#return true
	return map.get_cellv(cell) == 0 || map.get_cellv(cell) == 1

#Step according to the input (unit) vector
func step(dir):
	#calculate new cell
	var new_cell = get_map_pos() + dir
	
	#Check if it's a valid step
	if is_floor(new_cell) == true:
		set_map_pos(new_cell)
	else:
		pass

#func _input( event ):
#
#	# Input
#    # Step Actions
#	if event.is_action_pressed("ui_up"):
#		step( Vector2( 0, -1 ) )
#	if event.is_action_pressed("ui_down"):
#		step( Vector2( 0, 1 ) )
#	if event.is_action_pressed("ui_left"):
#		step( Vector2( -1, 0 ) )
#	if event.is_action_pressed("ui_right"):
#		step( Vector2( 1, 0 ) )
	
	
	
#A function that takes a step in the stored path
#Returns true if done with path
#Returns false if not
func path_step():
	
	if path.size() == 0:
		return(true) #Do nothings since there are no more steps left
	
	#Take the first Vector2 in the list
	var next_coords = path.pop_front()
	
	#Move the Creature there (remember to convert to world coords from map)
	position = map.map_to_world(next_coords)
	
	return(false)
	
	
	
#Function that adds a bunch of single points to path
#This makes a character stand in one position for a ffew cycles
func command_stay(position, cycles):
	for i in cycles:
		path.append(position)
	
	
	
	