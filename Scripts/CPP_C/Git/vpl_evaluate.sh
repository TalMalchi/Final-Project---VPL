#!/bin/bash

bash pre_vpl_run.sh
bash ./grade > ans.txt

total_grade=$?
echo $total_grade



# Create the vpl_execution script
echo "#!/bin/bash" > vpl_execution
echo "echo '<|--'" >> vpl_execution
echo "echo '-$(head -n -1 ans.txt)'" >> vpl_execution
echo "echo '--|>'" >> vpl_execution
echo "echo" >> vpl_execution



# Append the total grade to vpl_execution script
echo "echo 'Grade :=>>$total_grade'" >> vpl_execution

# Make vpl_execution script executable
chmod +x vpl_execution


# Display the vpl_execution script
cat vpl_execution

