extends Node2D

@export var game_menu: Panel
@export var drive_menu: Panel

func _process(_delta):
	if Input.is_action_just_pressed('reload'):
		print_debug('Reloading scene...')
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed('screen'):
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN \
			if is_window else DisplayServer.WINDOW_MODE_WINDOWED)

func _ready() -> void:
	hide_menus()
	game_menu.show()
	
func hide_menus() -> void:
	var menus = get_tree().get_nodes_in_group("menus")
	for menu in menus:
		menu.hide()
	
func _on_play_game_btn_pressed() -> void:
	game_menu.hide()
	drive_menu.show()
	
func load_scene() -> void:
	pass
	
func _on_back_btn_pressed() -> void:
	hide_menus()
	game_menu.show()

func _on_quit_btn_pressed() -> void:
	get_tree().call_deferred("quit")
