function wtree
	while true
		clear
		tree -a -I 'generation|bin|build|__pycache__|node_modules|.git|*.swp'
		sleep 5
	end
end
