extends Node2D

@export var canvas: CanvasLayer
@export var button: Button
@export var title: Label
@export var game_menu: Panel
@export var drive_menu: Panel
@export var circle_menu: Panel
@export var car_menu: Panel
@export var square: PackedScene
@export var thor: PackedScene
@export var cup: PackedScene
@export var spa: PackedScene
@export var curve: PackedScene
	
var menus: Array
var panels: Array
var track_scene
var square_inst
var thor_inst
var cup_inst
var spa_inst
var curve_inst

func _ready() -> void:
	panels = get_tree().get_nodes_in_group("panels")
	menus = get_tree().get_nodes_in_group("menus")
	hide_menus()
	show_panels()
	button.hide()
	game_menu.show()
	square_inst = square.instantiate()
	thor_inst = thor.instantiate()
	cup_inst = cup.instantiate()
	spa_inst = spa.instantiate()
	curve_inst = curve.instantiate()

func _process(_delta):
	if Input.is_action_just_pressed('screen'):
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN \
			if is_window else DisplayServer.WINDOW_MODE_WINDOWED)

func _on_button_pressed() -> void:
	print ("<<PLAYING>>")
	_on_home_btn_pressed()

func _on_home_btn_pressed() -> void:
	hide_menus()
	show_panels()
	button.hide()
	game_menu.show()
	
func _on_quit_btn_pressed() -> void:
	get_tree().call_deferred("quit")
	
func hide_menus() -> void:
	for menu in menus:
		menu.hide()

func hide_panels() -> void:
	for panel in panels:
		panel.hide()
		
func show_panels() -> void:
	for panel in panels:
		panel.show()
	
func _on_play_game_btn_pressed() -> void:
	hide_menus()
	hide_panels()
	drive_menu.show()

func _on_circle_tracks_pressed() -> void:
	hide_menus()
	hide_panels()
	circle_menu.show()


func _on_fanta_6600_pressed() -> void:
	hide_menus()
	hide_panels()
	title.hide()
	button.show()

func _on_fantina_3300_pressed() -> void:
	hide_menus()
	hide_panels()
	title.hide()
	button.show()

func _on_fantisima_800_pressed() -> void:
	hide_menus()
	hide_panels()
	title.hide()
	button.show()

func _on_curve_roads_pressed() -> void:
	track_scene = open_track(curve_inst)
	hide_menus()
	hide_panels()
	#car_menu.show()

func _on_thor_circus_pressed() -> void:
	track_scene = open_track(thor_inst)
	hide_menus()
	hide_panels()
	#car_menu.show()

func _on_square_land_pressed() -> void:
	track_scene = open_track(square_inst)
	hide_menus()
	hide_panels()
	#car_menu.show()

func _on_spa_flat_pressed() -> void:
	track_scene = open_track(spa_inst)
	hide_menus()
	hide_panels()
	#car_menu.show()

func _on_cup_circus_pressed() -> void:
	track_scene = open_track(cup_inst)
	hide_menus()
	hide_panels()
	#car_menu.show()

func open_track(instance: Node):
	canvas.hide()
	for inst in get_tree().get_nodes_in_group("Tracks"):
		inst.queue_free()
	get_parent().add_child(instance)
	instance.add_to_group("Tracks")
	instance.set_process(true)
	print("Node \"", name, "\" attached ", instance.name)
	return instance

	
