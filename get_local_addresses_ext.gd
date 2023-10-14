func get_local_addresses_ext(include_ipv6:bool = true, include_localhost:bool = true) -> Array:
	var localhost_addresses_v4 = ["localhost","127.0.0.1"]
	var localhost_addresses_v6 = [":::::::0001",":::::::1","0:0:0:0:0:0:0:0001","0:0:0:0:0:0:0:1","0000:0000:0000:0000:0000:0000:0000:0001"]
	var local_addresses = IP.get_local_addresses()
	var addresses:Array = []
	for local_address in local_addresses:
		var address_info = {"address":local_address,"version":null,"class":null}
		if localhost_addresses_v4.has(local_address) or localhost_addresses_v6.has(local_address):
			if include_localhost:
				if localhost_addresses_v4.has(local_address):
					address_info["version"] = 4
					addresses.append(address_info)
				elif localhost_addresses_v6.has(local_address) and include_ipv6:
					address_info["version"] = 6
					addresses.append(address_info)
		else:
			if local_address.find(".") != -1:
				address_info["version"] = 4
				var address_string_array = Array(local_address.split("."))
				var address_int_array = []
				for block in range(0,address_string_array.size()):
					address_int_array.append(address_string_array[block].to_int())
				match address_int_array[0]:
					10:
						if address_int_array[1] in range(0,256) and address_int_array[2] in range(0,256) and address_int_array[3] in range(1,256):
							address_info["class"] = "a";
					172:
						if address_int_array[1] in range(16,31) and address_int_array[2] in range(0,256) and address_int_array[3] in range(1,256):
							address_info["class"] = "b";
					192:
						if address_int_array[1] == 168 and address_int_array[2] in range(0,256) and address_int_array[3] in range(1,256):
							address_info["class"] = "c";
			elif local_address.find(":") != -1 and include_ipv6:
				address_info["version"] = 6
				address_info["class"] = null
				var address_string_array = Array(local_address.split(":"))
				var address_int_array = []
				for block in range(0,address_string_array.size()):
					address_int_array.append(address_string_array[block].to_int())
				addresses.append(address_info)
	return(addresses)
