class_name Apartment
extends Node2D

const _BASE_PRICE: int = 1000000
var _total_defect_price_decrement_percent: float = 1.0
var _total_price: float = _BASE_PRICE
var _defects: Array[Defect] = []


func _ready() -> void:
	_collect_defects(self)
	
	for defect in _defects:
		var room: Room = defect.get_parent().get_parent() as Room

		var defect_price_decrement_percent: int = defect.get_price_decrement_percent()
		
		print("%s (%s): -%d%%" % [defect, room.name, defect_price_decrement_percent])
		
		_total_defect_price_decrement_percent *= 1.0 - defect_price_decrement_percent / 100.0
	
	_total_price = _total_price * _total_defect_price_decrement_percent
	print("Найдено дефектов: %d" % _defects.size())
	print("Итоговая сумма: %d" % _total_price)


func _collect_defects(parent_node: Node) -> void:
	for child in parent_node.get_children():
		if child is Defect:
			_defects.push_back(child)
		
		_collect_defects(child)
