extends Node

# From day levels
var quota = 3
var quota_dict = {1: 3, 2: 5, 3: 7, 4:10, 5:15}
var time = 300.0 #in seconds
var difficulty = 1 # 1 - easy; 2 -n medium; 3 - hard; 4 - impossible; 5 - seriously
var lives = 3


# Global variables
var score = 0
var fished = false
var finished = false

# add randomizer for scenes
var Night1 = "res://Scenes/Levels/Night/Night1.tscn"
var Night2 = "res://Scenes/Levels/Night/Night2.tscn"
var Night3 = "res://Scenes/Levels/Night/Night3.tscn"

#day levels
var Day = "res://Scenes/Levels/Day/Day1.tscn"

#game state
var state

func get_day_strings() -> Array:
	if difficulty == 1:
		return [
		"scan_network;", 
		"access_patient_records;", 
		"bypass_antivirus;", 
		"copy_database_backup;", 
		"deploy_keylogger;", 
		"view_public_records;", 
		"change_user_password;", 
		"extract_metadata;", 
		"intercept_emails;", 
		"monitor_web_traffic;"
		]
	elif difficulty == 2:
		return [
		"decrypt_simple_password;", 
		"modify_web_content;", 
		"exploit_vulnerable_service;", 
		"escalate_privileges;", 
		"spoof_email;", 
		"tamper_audit_logs;", 
		"access_internal_wiki;", 
		"plant_malware;", 
		"disable_security_tools;", 
		"map_internal_network;"
		]
	elif difficulty == 3:
		return [
		"create_custom_exploit;", 
		"decrypt_complex_password;", 
		"bypass_multi_factor_authentication;", 
		"manipulate_financial_records;", 
		"install_rootkit;", 
		"compromise_critical_systems;", 
		"exploit_zero_day_vulnerability;", 
		"intercept_communications;", 
		"exfiltrate_sensitive_data;", 
		"manipulate_database_entries;"
		]
	elif difficulty == 4:
		return [
		"compromise_network_infrastructure;", 
		"develop_persistent_backdoor;", 
		"manipulate_system_firmware;", 
		"conduct_spear_phishing_attack;", 
		"execute_remote_code;", 
		"perform_advanced_persistent_threat;", 
		"undermine_cryptographic_protocols;", 
		"deploy_advanced_malware;", 
		"subvert_software_update_process;", 
		"access_top_secret_files;"
		]
	elif difficulty == 5:
		return [
		"conduct_advanced_persistent_threat_operations;", 
		"exploit_vulnerability --type \"SQL injection\";", 
		"infiltrate_secure_server --method \"exploit chaining\";", 
		"compromise_national_security_systems;", 
		"extract_sensitive_data --target \"financial_records\";", 
		"manipulate_critical_infrastructure;", 
		"bypass_advanced_encryption_standards;", 
		"orchestrate_global_cyber_attack;", 
		"brute_force_password --target \"hospital_database\";", 
		"deploy_ransomware --target \"critical_infrastructure\";"
		]
	else:
		return []

var current_scene = "Night1"
var transition_scene = false

var player_start_posX = 50
var player_start_posY = 25

func finish_changeScenes():
	transition_scene = false
	finished = false
	fished = false

	if current_scene == "Night1":
		current_scene = "Night2"
	elif current_scene == "Night2":
		current_scene = "Night3"
	elif current_scene == "Night3":
		current_scene = "Night1"

func add_score():
	score += 1

func lose(): # change tree scene to lose screen
	get_tree().change_scene_to_file("res://Scenes/Lose.tscn")

func win(): # change tree scene to win screen
	get_tree().change_scene_to_file("res://Scenes/Win.tscn")
