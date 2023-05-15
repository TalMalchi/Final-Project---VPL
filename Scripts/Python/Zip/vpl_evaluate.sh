#!/bin/bash
bash pre_vpl_run.sh

python3 -m unittest discover -v -b -p *_test.py >> ans.txt 2>&1
echo "#!/bin/bash" >> vpl_execution

echo "echo '<|--'" >> vpl_execution
		echo "echo '-$(cat ans.txt)'" >> vpl_execution
		echo "echo '--|>'" >> vpl_execution		
		echo "echo" >> vpl_execution

#Get the number of test run
test_run=$(grep -oP 'Ran \d+ tests' ans.txt |awk '{print $2}')

#Get the number of test failed
test_failed=$(grep -oP 'FAILED \(failures=\K\d+' ans.txt )
test_errors=$(grep -oP 'FAILED \(errors=\K\d+' ans.txt )

#print the result
echo "Test run: $test_run"
echo "Test failed: $test_failed"
echo "Test error: $test_errors"

if [[ -z "$test_errors" ]]; then
  test_errors=0
fi

if [[ -z "$test_failed" ]]; then
  test_failed=0
fi

grade=$(echo "scale=10; 100.0 / $test_run * ($test_run - ($test_failed + $test_errors))" | bc)
#grade=$((echo "scale=2; 100.0 / $test_run") | bc)
echo $grade

#-------------------------------------
grade=$(./round_grade.sh $grade)
python3 -m unittest discover -v -p *_test.py >> ans.txt 2>&1
if [ $? -eq 0 ]; then
    echo "All tests passed!"
    echo "echo 'Grade :=>> 100'" >> vpl_execution
else
    echo "There were test failures or errors."
    echo "echo 'Grade :=>> $grade'" >> vpl_execution
fi		

chmod +x vpl_execution
cat vpl_execution

