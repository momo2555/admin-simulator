extends KinematicBody2D

var vel = Vector2()
var orientation = 0
const gravite = 1100
const UP = Vector2(0 ,-1)
const accel = 5

func _ready():
	$jauges2D/folie2D.value = GLOBAL.folie
	$jauges2D/pv2D.value = GLOBAL.pv


func _physics_process(delta):        #execute 60 ticks par seconde
	vel.x=0
	if not is_on_floor():
		vel.y+=gravite*delta
	movement_loop()
	move_and_slide(vel,Vector2(0,-1))
	GLOBAL.folie += GLOBAL.vitessejauge
	$jauges2D/folie2D.value = GLOBAL.folie
	
func movement_loop():
	var gauche = Input.is_action_pressed("gauche")    # mouvement gauche
	var droite = Input.is_action_pressed("droite")    # mouvement droite
	var dirx = int(droite) - int(gauche)
	var jump = Input.is_action_just_pressed("saut")
	if dirx == -1:
		vel.x-= GLOBAL.speed +40    
		animation_loop("gauche2D")                       # mouvement gauche                              
		#animation_loop("gauche")     # animation gauche
		orientation = 0
	elif dirx == 1:
		vel.x+= GLOBAL.speed +40     
		animation_loop("droite2D");                        # mouvement droite                             
		#animation_loop("droite")     # animation droite
		orientation = 1
	else:
		if orientation == 0:
			animation_loop("imoGauche2D");
		elif orientation == 1:
			animation_loop("imoDroite2D");
		vel.x=0
	if jump == true and is_on_floor(): #fonction de saut
		vel.y = -400
		
	if not is_on_floor():	#animation lorsque le perso ne touche pas le sol
		#en mode saut
		if orientation == 0: #orientation gauche (saut gauche)
			animation_loop("sautGauche2D");
		elif orientation == 1: #orientation gauche (saut droite)
			animation_loop("sautDroite2D");
			
	

	
	#if vel.x == 0 and vel.y ==0:         # gestion des positions immobiles
		#if orientation == 0:
			#animation_loop("gauche immo")
		#elif orientation == 1:
			#animation_loop("droite immo")
		
		
		
func animation_loop(animation):
	if $anim.current_animation != animation:
		$anim.play(animation)
