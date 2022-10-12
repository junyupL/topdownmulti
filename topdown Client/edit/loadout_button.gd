class_name LoadoutButton
extends OptionButton


func _on_Loadouts_item_selected(id):
	get_parent().lo_name_change(get_item_text(get_item_index(id)))
