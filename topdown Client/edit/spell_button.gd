extends ItemList

const RUNES = 0
const SKILLS = 1




func _on_Skills_item_selected(index):
	var skills = get_parent().lo_names[get_parent().c_lo_name][SKILLS]
	skills[get_parent().skill_pos] = get_item_text(index)
