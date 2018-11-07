
extends Node


#
#Determine which color will better contrast input color:
#Black or White?
func contrastColor(in_col):

	var in_brightness_count = 0 #this will keep track of which channels are bright (over 0.5)
	if in_col.r > 0.5:
		in_brightness_count = in_brightness_count + 1
	if in_col.g > 0.5:
		in_brightness_count = in_brightness_count + 1
	if in_col.b > 0.5:
		in_brightness_count = in_brightness_count + 1

	#If the majority of channels are bright, return black (for contrast)
	if in_brightness_count >=2:
		return(Color(0,0,0))
	#Otherwise return white
	else:
		return(Color(1,1,1))