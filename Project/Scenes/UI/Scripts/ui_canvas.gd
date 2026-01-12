extends CanvasLayer

var logs: RichTextLabel
var PFG: Control 
var message: Label
var help: Label
var topline: Label
var speedometer_label: Label
var Analometer: Control

func _ready() -> void:
	logs = $MarginContainer/VBoxContainer/Info/Logs
	PFG = $MarginContainer/VBoxContainer/PFG
	message = $Message
	help = $Help
	topline = $MarginContainer/Topline
	speedometer_label = $MarginContainer/VBoxContainer/Speedometer/Label

func _process(_delta: float) -> void:
	topline.text = (str(Engine.get_frames_per_second())
		+ ' fps [F1] help [F5] reload [F6] view modes')

func call_draw_curve(curve: Array):
	if not PFG:
		PFG = $MarginContainer/VBoxContainer/PFG
	var draw_node = PFG
	draw_node.curve_array = curve
	draw_node.queue_redraw()

func show_message(text):
	if not message:
		message = $Message
	message.text = text
	message.show()
	help.show()
	await get_tree().create_timer(2.5).timeout
	message.hide()
	help.hide()
	
func show_message_again():
	message.show()
	help.show()
	await get_tree().create_timer(5).timeout
	message.hide()
	help.hide()
	
func hide_info() -> void:
	logs.hide()
	
func show_info() -> void:
	logs.show()
	
func set_speedometer_label(text) -> void:
	speedometer_label.text = text
	
func logs_hide() -> void:
	logs = $MarginContainer/VBoxContainer/Info/Logs
	logs.hide()
	
func logs_show() -> void:
	logs = $MarginContainer/VBoxContainer/Info/Logs
	logs.show()
	
func logs_get() -> RichTextLabel:
	logs = $MarginContainer/VBoxContainer/Info/Logs
	return logs
	
func logs_clr_text() -> void:
	$MarginContainer/VBoxContainer/Info/Logs.text = ""
	
func logs_add_text(text) -> void:
	$MarginContainer/VBoxContainer/Info/Logs.text += text
	
func logs_ins_text(text) -> void:
	$MarginContainer/VBoxContainer/Info/Logs.text = text +\
			$MarginContainer/VBoxContainer/Info/Logs.text
			
func get_analometer() -> Control:
	Analometer = $MarginContainer/VBoxContainer/Analometer
	return Analometer
	
func rotate_wheel(rot) -> void:
	$MarginContainer/Control/Wheel.rotation = rot
	
func set_brake_pedal(val) -> void:
	$MarginContainer/VBoxContainer/WheelsRearSleep/Brake.value = val
	
func set_accelerate_pedal(val) -> void:
	$MarginContainer/VBoxContainer/WheelsRearSleep/Accelerate.value = val
	
