#!/bin/bash
bash pre_vpl_run.sh
bash ./grade >> ans.txt
#cat vpl_environment.sh >> vpl_execution
echo "#!/bin/bash" >> vpl_execution
echo "echo '<|--'" >> vpl_execution
		echo "echo '-$(head -n -1 ans.txt)'" >> vpl_execution
		echo "echo '--|>'" >> vpl_execution		
		echo "echo" >> vpl_execution
		
echo "echo 'Grade :=>>$(grep 'Grade:' ./ans.txt | cut -d' ' -f2)'" >> vpl_execution

chmod +x vpl_execution

cat vpl_execution