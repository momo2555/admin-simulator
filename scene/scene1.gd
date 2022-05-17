extends Node2D

export(String, FILE, "*.tscn") var next_down
export(String, FILE, "*.tscn") var next_up
export(String, FILE, "*.tscn") var boss

func _ready():
	$Player.global_position = $Transitions/Spawn_down.global_position
	match GLOBAL.sens:
		GLOBAL.UP:
			$Player.global_position = $Transitions/Spawn_down.global_position
		GLOBAL.DOWN:
			$Player.global_position = $Transitions/Spawn_up.global_position
		GLOBAL.BOSS:
			$Player.global_position = $boss1/a_suppr.global_position



func _on_Exit_down_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene(next_down)
		GLOBAL.set_sens(GLOBAL.DOWN)
		
func _on_Exit_up_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene(next_up)
		GLOBAL.set_sens(GLOBAL.UP)
		


func _on_Lenteur_escal_body_entered(body):
	if body.name == 'Player':
		GLOBAL.speed = GLOBAL.speed - (GLOBAL.speed/1.75)
	
func _on_Lenteur_escal_body_exited(body):
	if body.name == 'Player':
		GLOBAL.speed = 180


func _on_a_supprimer_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene(boss)
		GLOBAL.set_sens(GLOBAL.BOSS)
	


