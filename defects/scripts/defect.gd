@abstract class_name Defect
extends Area2D

## процент снижения базовой цены квартиры. Переопределяется у наследников
var _price_decrement_percent: int = 0

func get_price_decrement_percent() -> int:
	return _price_decrement_percent

@abstract func _set_price_decrement_percent() -> void

func _ready() -> void:
	_set_price_decrement_percent()
	
@abstract func _to_string() -> String;
