function asl
	awk '{ print $NF }' | sed 's/*//' | xargs less
end
