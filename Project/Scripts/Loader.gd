extends Node2D

@export var button: Button
@export var title: Label
@export var game_menu: Panel
@export var drive_menu: Panel
@export var circle_menu: Panel
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

func _on_square_land_pressed() -> void:
	hide_menus()
	hide_panels()
	button.show()

func _on_spa_flat_pressed() -> void:
	hide_menus()
	hide_panels()
	button.show()


func _on_cup_circus_pressed() -> void:
	hide_menus()
	hide_panels()
	button.show()
