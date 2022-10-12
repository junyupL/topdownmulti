extends Label

export var rune_cost:int

const RUNES = 0
const SKILLS = 1

func _on_add_pressed():
	var rune_count = get_parent().get_parent().lo_names[get_parent().get_parent().c_lo_name][RUNES]
	
	if get_parent().get_parent().rune_points - rune_cost >= 0:
		rune_count[name]+=1
		get_parent().get_parent().rune_points -= rune_cost
		get_parent().text = "runes - rune points: " + String(get_parent().get_parent().rune_points)
		text = name + ": " + String(rune_count[name])
		
	
func _on_remove_pressed():
	var rune_count = get_parent().get_parent().lo_names[get_parent().get_parent().c_lo_name][RUNES]
	
	if (rune_count[name] > 0):
		rune_count[name]-=1
		get_parent().get_parent().rune_points += rune_cost
		get_parent().text = "runes - rune points: " + String(get_parent().get_parent().rune_points)
		text = name + ": " + String(rune_count[name])
