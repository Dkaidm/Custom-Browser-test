extends Node

signal tab_closed(tab_id)
signal tab_switched(tab_id)

var tabs = {}
var active_tab = null
var last_activity_times = {}
var settings

func _ready():
	settings = get_node("/root/Settings")

func _process(delta):
	check_inactive_tabs()
	enforce_tab_limit()

func create_tab(url, browser_instance):
	if len(tabs) >= settings.browser_settings["max_tabs"]:
		close_oldest_inactive_tab()
	
	var tab_id = generate_tab_id()
	tabs[tab_id] = {
		"browser": browser_instance,
		"url": url,
		"created_time": Time.get_unix_time()
	}
	update_tab_activity(tab_id)
	return tab_id

func close_tab(tab_id):
	if tabs.has(tab_id):
		var browser = tabs[tab_id]["browser"]
		if browser:
			browser.queue_free()
		tabs.erase(tab_id)
		last_activity_times.erase(tab_id)
		emit_signal("tab_closed", tab_id)

func switch_tab(tab_id):
	if tabs.has(tab_id):
		active_tab = tab_id
		update_tab_activity(tab_id)
		emit_signal("tab_switched", tab_id)

func update_tab_activity(tab_id):
	if tabs.has(tab_id):
		last_activity_times[tab_id] = Time.get_unix_time()

func check_inactive_tabs():
	var current_time = Time.get_unix_time()
	var timeout = settings.browser_settings["inactive_tab_timeout"] * 60  # Convert minutes to seconds
	
	for tab_id in last_activity_times.keys():
		if tab_id != active_tab:
			var inactive_time = current_time - last_activity_times[tab_id]
			if inactive_time > timeout:
				close_tab(tab_id)

func enforce_tab_limit():
	var max_tabs = settings.browser_settings["max_tabs"]
	while len(tabs) > max_tabs:
		close_oldest_inactive_tab()

func close_oldest_inactive_tab():
	var oldest_time = INF
	var oldest_tab = null
	
	for tab_id in last_activity_times.keys():
		if tab_id != active_tab:
			var activity_time = last_activity_times[tab_id]
			if activity_time < oldest_time:
				oldest_time = activity_time
				oldest_tab = tab_id
	
	if oldest_tab:
		close_tab(oldest_tab)

func generate_tab_id():
	return str(hash(str(Time.get_unix_time()) + str(randi())))

func get_active_tab():
	return active_tab

func get_tab_browser(tab_id):
	if tabs.has(tab_id):
		return tabs[tab_id]["browser"]
	return null
