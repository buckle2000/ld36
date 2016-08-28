function create_proxy(t, accept_fields)
	local proxy_mt = {}
	function proxy_mt:__index(key)
		if table.contains(accept_fields, key) then
			return t[key]
		else
			return rawget(self, key)
		end
	end
	function proxy_mt:__newindex(key, value)
		if table.contains(accept_fields, key) then
			t[key] = value
		else
			rawset(self, key, value)
		end
	end
	return setmetatable({}, proxy_mt)
end
