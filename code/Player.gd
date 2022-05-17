extends KinematicBody2D

var vel = Vector2()
var orientation = 0

func _ready():
	$jauges/folie.value = GLOBAL.folie
	$jauges/pv.value = GLOBAL.pv
	


func _physics_process(delta):        #execute 60 ticks par seconde
	vel.x=0
	vel.y=0
	if not GLOBAL.dialoging:
		movement_loop()
		move_and_slide(vel)
	GLOBAL.folie += GLOBAL.vitessejauge
	$jauges/folie.value = GLOBAL.folie
	
	
func movement_loop():
	var gauche = Input.is_action_pressed("gauche")    # mouvement gauche
	var droite = Input.is_action_pressed("droite")    # mouvement droite
	var dirx = int(droite) - int(gauche)
	var haut = Input.is_action_pressed("haut")      # mouvement haut
	var bas = Input.is_action_pressed("bas")        # mouvement bas
	var diry = int(haut) - int(bas)
	
	if dirx == -1:
		vel.x-= GLOBAL.speed                              # mouvement gauche
		if diry == 0:                               
			animation_loop("gauche")     # animation gauche
			orientation = 0
	elif dirx == 1:
		vel.x+= GLOBAL.speed                              # mouvement droite
		if diry == 0:                               
			animation_loop("droite")     # animation droite
			orientation = 1
	else:
		vel.x=0
	
	if diry == 1:
		vel.y-= GLOBAL.speed                              # mouvement haut
		if dirx == 0:                              
			animation_loop("dos")         # animation dos
			orientation = 2
	elif diry == -1: 
		vel.y+= GLOBAL.speed                              # mouvement bas
		if dirx == 0:                           
			animation_loop("face")        # animation face
			orientation = 3
	else:
		vel.y=0
	if vel.x == 0 and vel.y ==0:         # gestion des positions immobiles
		if orientation == 0:
			animation_loop("gauche immo")
		elif orientation == 1:
			animation_loop("droite immo")
		elif orientation == 2:
			animation_loop("dos immo")
		elif orientation == 3:
			animation_loop("face immo")
		elif orientation == 4:
			animation_loop("facegauche immo")		
		elif orientation == 5:
			animation_loop("facedroite immo")		
		elif orientation == 6:
			animation_loop("dosgauche immo")
		elif orientation == 7:
			animation_loop("dosdroite immo")								
		
	if dirx == -1 and diry == -1:               # les animations en diagonale
		animation_loop("facegauche")
		orientation = 4
	elif dirx == 1 and diry == -1:
		animation_loop("facedroite")
		orientation = 5
	elif dirx == -1 and diry == 1:
		animation_loop("dosgauche")
		orientation = 6
	elif dirx == 1 and diry == 1:
		animation_loop("dosdroite")
		orientation = 7

		
func animation_loop(animation):
	if $anim.current_animation != animation:
		$anim.play(animation)
	 
		
		


func _on_hitbox_body_entered(body):
	pass # Replace with function body.
