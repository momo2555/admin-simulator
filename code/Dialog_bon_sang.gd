extends Control

var dialog = [
	'Bonjour',
	'Bienvenue dans le monde des Pokémon',
	'Blabla',
	'Bon tu es un gars ou une meuf?'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
	
func _process(delta):
	if Input.is_action_just_pressed("action") and GLOBAL.dialoging:
		load_dialog();
	$"letriangle".visible = finished
	
func load_dialog():
	if dialog_index < dialog.size():
		self.visible = true
		GLOBAL.dialoging = true;
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		GLOBAL.dialoging = false;
		self.visible =false
		#queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
	$letriangle/AnimationPlayer.play("anim_triangle")
	
func _on_load_dialog():
	print_debug("emitted")
	dialog_index = 0
	finished = false
	load_dialog()

func _on_Area2D_body_entered(body):
	if Input.is_action_just_pressed("action"):
		load_dialog()
	
