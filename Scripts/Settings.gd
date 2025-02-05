extends Node2D

# note: i fucking hate myself for making enums this long. this is unreadable

@onready var checkbuttons: Array[CheckButton] = [
	$Sunlight/CheckButton,
	$FeverDream/CheckButton,
	$RandomAhhHighlighter/CheckButton,
	$FeverDream3/CheckButton
]

@onready var checkboxes: Array[CheckBox] = [
	$Cursor/Entirely/CheckBox,
	$Cursor/CursorFollow/CheckBox2,
	$Cursor/CircleFollow/CheckBox3
]

@onready var browser_settings: Dictionary = {
	"enable_javascript": true,
	"enable_webgl": true,
	"enable_plugins": false,
	"enable_java": false,
	"frame_rate": 60,
	"memory_limit": 128,
	"cache_enabled": true,
	"cache_size": 50,  # MB
	"auto_clear_cache": true,
	"clear_cache_interval": 24,  # hours
	"image_optimization": true,
	"media_autoplay": false,
	"max_tabs": 20,
	"inactive_tab_timeout": 30,  # minutes
}

var last_cache_clear_time = 0

func _ready():
	set_initial_state()
	load_browser_settings()
	setup_cache()

func setup_cache():
	last_cache_clear_time = Time.get_unix_time()
	if browser_settings["auto_clear_cache"]:
		check_cache_clear()

func check_cache_clear():
	var current_time = Time.get_unix_time()
	var time_diff = current_time - last_cache_clear_time
	
	if time_diff >= browser_settings["clear_cache_interval"] * 3600:  # Convert hours to seconds
		clear_browser_cache()
		last_cache_clear_time = current_time

func clear_browser_cache():
	var cache_dir = "user://browser_cache"
	var dir = DirAccess.open(cache_dir)
	if dir:
		var files = dir.get_files()
		for file in files:
			dir.remove(file)
		print("Browser cache cleared")

func _process(delta):
	if browser_settings["auto_clear_cache"]:
		check_cache_clear()

func set_initial_state():
	var shader_types = [
		ShaderManager.ShaderType.SUNLIGHT,
		ShaderManager.ShaderType.FEVER_DREAM,
		ShaderManager.ShaderType.RANDOM_ASS_HIGHLIGHT,
		ShaderManager.ShaderType.SCREEN_CRACK,
		ShaderManager.ShaderType.BLOCK_CAMERA_MOVEMENT,
		ShaderManager.ShaderType.CURSOR_FOLLOW_ON,
		ShaderManager.ShaderType.CIRCLE_FOLLOW_ON
	]
	
	for i in range(checkbuttons.size()):
		checkbuttons[i].button_pressed = ShaderManager.get_shader(shader_types[i])
	
	for i in range(checkboxes.size()):
		checkboxes[i].button_pressed = ShaderManager.get_shader(shader_types[i + 4])

func save_browser_settings():
	var save_file = FileAccess.open("user://browser_settings.dat", FileAccess.WRITE)
	save_file.store_var(browser_settings)
	save_file.close()

func load_browser_settings():
	if FileAccess.file_exists("user://browser_settings.dat"):
		var save_file = FileAccess.open("user://browser_settings.dat", FileAccess.READ)
		browser_settings = save_file.get_var()
		save_file.close()

func _on_shader_toggled(shader_type: ShaderManager.ShaderType, toggled_on: bool):
	ShaderManager.set_shader(shader_type, toggled_on)
	
	if shader_type == ShaderManager.ShaderType.BLOCK_CAMERA_MOVEMENT:
		if toggled_on:
			disable_cursor_and_circle()

	elif shader_type in [ShaderManager.ShaderType.CURSOR_FOLLOW_ON, ShaderManager.ShaderType.CIRCLE_FOLLOW_ON]:
		if toggled_on:
			disable_block_camera()

func disable_cursor_and_circle():
	ShaderManager.set_shader(ShaderManager.ShaderType.CURSOR_FOLLOW_ON, false)
	ShaderManager.set_shader(ShaderManager.ShaderType.CIRCLE_FOLLOW_ON, false)
	checkboxes[1].button_pressed = false
	checkboxes[2].button_pressed = false

func disable_block_camera():
	ShaderManager.set_shader(ShaderManager.ShaderType.BLOCK_CAMERA_MOVEMENT, false)
	checkboxes[0].button_pressed = false

func _on_sunlight(toggled_on): _on_shader_toggled(ShaderManager.ShaderType.SUNLIGHT, toggled_on)
func _on_fever_dream(toggled_on): _on_shader_toggled(ShaderManager.ShaderType.FEVER_DREAM, toggled_on)
func _on_highlighter(toggled_on): _on_shader_toggled(ShaderManager.ShaderType.RANDOM_ASS_HIGHLIGHT, toggled_on)
func _on_crack(toggled_on): _on_shader_toggled(ShaderManager.ShaderType.SCREEN_CRACK, toggled_on)
func _on_entire_camera(toggled_on): _on_shader_toggled(ShaderManager.ShaderType.BLOCK_CAMERA_MOVEMENT, toggled_on)
func _on_cursor(toggled_on): _on_shader_toggled(ShaderManager.ShaderType.CURSOR_FOLLOW_ON, toggled_on)
func _on_circle(toggled_on): _on_shader_toggled(ShaderManager.ShaderType.CIRCLE_FOLLOW_ON, toggled_on)
