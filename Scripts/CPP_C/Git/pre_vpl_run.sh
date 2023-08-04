student_files="student_folder"
teacher_files="teacher_folder"
requested_file="link.txt" # Name of the file containing student input

commit_teacher="f40446d"
teacher_link="https://github.com/itay-kar/orgchart-b_test.git" # Link to teacher's git repository

mapfile -t input_lines < "$requested_file"
repo_url="${input_lines[0]}"
commit_hash="${input_lines[1]}"

# Clone the student's repository
git clone --quiet "$repo_url" "$student_files"

# Clone the teacher's repository with the teacher's commit
git clone --quiet "$teacher_link" "$teacher_files"
cd "$teacher_files"
git checkout "$commit_teacher"
cd ..

# Check if the provided commit hash matches the first 7 characters of the actual commit hash in the student's repository
cd "$student_files"
actual_commit_hash=$(git rev-parse --short=7 HEAD)
cd ..

echo
echo "Desired commit hash: $commit_hash"
echo "Actual commit hash in student's repository: $actual_commit_hash"
echo

if [[ "$commit_hash" == "$actual_commit_hash" ]]; then
    echo "The student's repository has the desired commit: $commit_hash"

    # Proceed with the rest of the script
    find "$student_files" -type f -exec cp -n {} "$teacher_files" \;
    find "$student_files" -exec cp -nR {} "$teacher_files" \;
    rm -f -r "$student_files"
    mv "$teacher_files"/* ./

else
    echo "The student's repository does not have the desired commit: $commit_hash"
    # Additional actions or validations for this case
fi
