extends StaticBody2D
signal load_dialog

var can_dialog = false;
func _ready():
	var node = get_node("../Dialog_bon_sang/Dialog")
	self.connect("load_dialog", node, "_on_load_dialog")
	
func _process(delta):
	if Input.is_action_just_pressed("action") and can_dialog and not GLOBAL.dialoging:
		emit_signal("load_dialog")



func _on_Area2D_body_entered(body):
	can_dialog = true;
	pass
	


func _on_Area2D_body_shape_exited(body_id, body, body_shape, local_shape):
	can_dialog = false;
	pass
	
	#lol mdr ahahahhah
	#c'est mon tour
