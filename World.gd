extends Node2D

const PLAYERSPEED = 200

func _ready():		
	set_process(true)
	pass

func _process(delta):
	var rightPlayerPosition = get_node("rightPlayer").get_pos()
	if(Input.is_action_pressed("ui_up")):
		rightPlayerPosition.y += -PLAYERSPEED * delta
	if(Input.is_action_pressed("ui_down")):
		rightPlayerPosition.y += PLAYERSPEED * delta

	get_node("rightPlayer").set_pos(rightPlayerPosition)