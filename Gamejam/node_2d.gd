extends Node2D
var speed := 2
var direction := 1

func _process(delta: float) -> void:
	$Sprite2D.position.y += speed * direction
	if $Sprite2D.position.y >= 658:
		direction = -1
	if $Sprite2D.position.y <= 0: 
		direction = 1 
		$Sprite2D.scale *= 0.3 
	
	if direction == -1: 
		$Sprite2D.scale *= 1.003
