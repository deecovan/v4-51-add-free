extends Node2D

@export var canvas: CanvasLayer
@export var button: Button
@export var title: Label
@export var game_menu: Panel
@export var drive_menu: Panel
@export var circle_menu: Panel
@export var car_menu: Panel

var square = preload("res://Scenes/Tracks/square.tscn")
	#spa = preload("res://Scenes/Tracks/spa.tscn").instatiate()
	#cup = preload("res://Scenes/Tracks/cup.tscn").instatiate()
	#curve = preload("res://Scenes/Tracks/curve.tscn").instatiate()
	#thor = preload("res://Scenes/Tracks/thor.tscn").instatiate()
	
var menus: Array
var panels: Array

func _ready() -> void:
	panels = get_tree().get_nodes_in_group("panels")
	menus = get_tree().get_nodes_in_group("menus")
	hide_menus()
	show_panels()
	button.hide()
	game_menu.show()

func _process(_delta):
	if Input.is_action_just_pressed('reload'):
		print_debug('Reloading scene...')
		get_tree().reload_current_scene()
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
	button.show()

func _on_fantina_3300_pressed() -> void:
	hide_menus()
	hide_panels()
	button.show()

func _on_fantisima_800_pressed() -> void:
	hide_menus()
	hide_panels()
	button.show()

func _on_thor_circus_pressed() -> void:
	#track = open_track(thor)
	hide_menus()
	hide_panels()
	car_menu.show()

func _on_curve_roads_pressed() -> void:
	#var track = load_track(tracks.curve)
	hide_menus()
	hide_panels()
	car_menu.show()


func _on_square_land_pressed() -> void:
	var track = open_track(square)
	hide_menus()
	hide_panels()
	car_menu.show()

func _on_spa_flat_pressed() -> void:
	#var track = open_track(spa)
	hide_menus()
	hide_panels()
	car_menu.show()

func _on_cup_circus_pressed() -> void:
	#var track = open_track(cup)
	hide_menus()
	hide_panels()
	car_menu.show()


func open_track(track):
	var instance = track.instatiate()
	get_parent().add_child(instance)
	instance.set_process(true)
	print("Node \"", name, "\" attached ", instance.name)
	instance.name = "Track"
	return instance

	
