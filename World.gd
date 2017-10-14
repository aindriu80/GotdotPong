extends Node2D

#Constants
const PLAYERSPEED = 400
const INITBALLSPEED = 100

#Variables
var screenSize
var padSize
var ballDirection = Vector2(1.0,0.0)
var ballSpeed = INITBALLSPEED

func _ready():		
	screenSize = get_viewport_rect().size
	padSize = get_node("rightPlayer").get_texture().get_size()
	set_process(true)
	pass

func _process(delta):
	#ball position
	var ballPosition = get_node("ball").get_pos()
	#colliders
	var leftColider = Rect2(get_node("leftPlayer").get_pos() - padSize*0.5, padSize)
	var rightColider = Rect2(get_node("rightPlayer").get_pos() - padSize*0.5, padSize)
	#variables for players positions
	var rightPlayerPosition = get_node("rightPlayer").get_pos()
	var leftPlayerPosition = get_node("leftPlayer").get_pos()
	
	#Check input and move the pads
	if(rightPlayerPosition.y > 0 and Input.is_action_pressed("ui_up")):
		rightPlayerPosition.y += -PLAYERSPEED * delta
	if(rightPlayerPosition.y < screenSize.y and Input.is_action_pressed("ui_down")):
		rightPlayerPosition.y += PLAYERSPEED * delta
	if(leftPlayerPosition.y > 0 and  Input.is_action_pressed("left_up")):
		leftPlayerPosition.y += -PLAYERSPEED * delta
	if(leftPlayerPosition.y< screenSize.y and Input.is_action_pressed("left_down")):
		leftPlayerPosition.y += PLAYERSPEED * delta
		
	ballPosition += ballDirection * ballSpeed * delta
	if((ballPosition.y <0 and ballDirection < 0) or (ballPosition.y > screenSize.y and ballDirection.y >0)):
		ballDirection.y = -ballDirection.y
	if(leftColider.has_point(ballPosition) or rightColider.has_point(ballPosition)):
		ballDirection.x = -ballDirection.x
		ballSpeed *= 1.4
		
	
	#Update the position of our players
	get_node("rightPlayer").set_pos(rightPlayerPosition)
	get_node("leftPlayer").set_pos(leftPlayerPosition)
	get_node("ball").set_pos(ballPosition)