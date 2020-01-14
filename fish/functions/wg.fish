function wg
	while true
clear
git lga -n 15
echo -e "\n====\n"
git status -s | grep -v smp2 | grep -v roject > /tmp/wg
head -n 25 /tmp/wg
echo -n "Nb modified : "(cat /tmp/wc | wc -l)" ("(git status -s | wc -l)")"
sleep 5
end
end
