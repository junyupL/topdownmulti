extends Node

#remote is called if rpc'ed by other people
	#remotesync is called if rpc'ed by anyone
	#master is called if rpc'ed by anyone, and you're the master
	#remotesync on server same as master
	#puppet is called if rpc'ed by anyone, and you're the puppet
	#if not rpc'ed, works just like a normal func
	#serverID 1

# create stage in /root/lobby/stage.

var player_info = {};
# Connect all functions

func _ready():
	get_tree().connect("network_peer_connected", self, "_np_connected")# on server and client, a player connected
	get_tree().connect("network_peer_disconnected", self, "_np_disconnected")# on server and client, a player disconnected

	
	var peer := NetworkedMultiplayerENet.new()
	peer.create_server(global.server_port, 2)
	get_tree().set_network_peer(peer)
	
	

func _np_connected(id):
	print('peer connected')

func _np_disconnected(id):
	player_info.erase(id) # Erase player from info.


remote func register_player(skills, rune_count):
	var starting := false
	
	if player_info.size() == 1:
		starting = true
		rpc_id(player_info.keys()[0], 'start_game', get_tree().get_rpc_sender_id(), skills, rune_count)
		rpc_id(get_tree().get_rpc_sender_id(), 'start_game', player_info.keys()[0],
		player_info[player_info.keys()[0]][0],
		player_info[player_info.keys()[0]][1])
		
		var player1node = $Stage/Player1
		var player2node = $Stage/Player2
		$Stage/Player1.name = str(player_info.keys()[0])
		$Stage/Player2.name = str(get_tree().get_rpc_sender_id())
		
	
	
	
	player_info[get_tree().get_rpc_sender_id()] = [skills, rune_count]
	
	if starting:
		for network_id in player_info.keys():
			for i in range(3):
				var skill_class = load('res://skills/' + player_info[network_id][0][i] + '.gd')
				$Stage.get_node(str(network_id) + '/Skills').add_child(skill_class.new())
			$Stage.get_node(str(network_id)).init_rune(player_info[network_id][1])

