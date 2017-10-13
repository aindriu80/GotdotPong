extends Node2D

#Constants
const PLAYERSPEED = 200

func _ready():		
	set_process(true)
	pass

func _process(delta):
	#variables for players positions
	var rightPlayerPosition = get_node("rightPlayer").get_pos()
	var leftPlayerPosition = get_node("leftPlayer").get_pos()
	
	#Check input and move the pads
	if(Input.is_action_pressed("ui_up")):
		rightPlayerPosition.y += -PLAYERSPEED * delta
	if(Input.is_action_pressed("ui_down")):
		rightPlayerPosition.y += PLAYERSPEED * delta
	if(Input.is_action_pressed("left_up")):
		leftPlayerPosition.y += -PLAYERSPEED * delta
	if(Input.is_action_pressed("left_down")):
		leftPlayerPosition.y += PLAYERSPEED * delta
	
	#Update the position of our players
	get_node("rightPlayer").set_pos(rightPlayerPosition)
	get_node("leftPlayer").set_pos(leftPlayerPosition)