extends CanvasLayer


func _physics_process(delta):
	if Input.is_action_just_pressed("Pausa"):
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible
		
	
	
