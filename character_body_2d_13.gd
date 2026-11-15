extends CharacterBody2D
@onready var hitbox =$Area2D


func _ready():
	hitbox.body_entered.connect(_on_hitbox_2_body_entered)
	
func _on_hitbox_2_body_entered(body: Node2D)-> void:
	get_tree().change_scene_to_file("res://restart.tscn")
