student_files="student_folder"
requested_file="link_py.txt" # Name of the file containing student input

# Read the student's input file and extract the repository URL and commit number
mapfile -t input_lines < "$requested_file"
repo_url="${input_lines[0]}"
commit_number="${input_lines[1]}"

# Clone the student's repository
git clone --quiet "$repo_url" "$student_files"

# Move to the student's repository directory
cd "$student_files"

# Check if the provided commit number matches the actual commit number in the student's repository
actual_commit_number=$(git rev-parse --short=7 HEAD)
echo $actual_commit_number
echo $commit_number
if [[ "$commit_number" == "$actual_commit_number" ]]; then
    echo "The student's repository has the desired commit number: $commit_number"
    mv ./* ..
    cd ..
    rm -rf "$student_files"
else
    echo "The student's repository does not have the desired commit number: $commit_number"
    cd ..
    rm -rf "$student_files"
fi
