extends Node

var opponent_info

func _ready():
	get_tree().connect("network_peer_connected", self, "_np_connected")
	get_tree().connect("network_peer_disconnected", self, "_np_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_to_server") #client only
	get_tree().connect("connection_failed", self, "_connect_fail") #client only
	get_tree().connect("server_disconnected", self, "_server_disconnected") #client only

	
	var peer := NetworkedMultiplayerENet.new()
	peer.create_client(global.server_IP, global.port)
	get_tree().set_network_peer(peer)
	

func _np_connected(id):
	pass #a peer connected

func _np_disconnected(id):
	#other player left
	pass

func _connected_to_server():
	rpc_id(1, "register_player", global.skills, global.rune_count)

func _server_disconnected():
	pass # Server kicked us

func _connect_fail():
	pass # Could not even connect to server
	
remote func start_game(opp_id, skills, rune_count):
	opponent_info = [skills, rune_count]
	$Stage/MyPlayer.name = str(get_tree().get_network_unique_id())
	$Stage/OpponentPlayer.name = str(opp_id)
