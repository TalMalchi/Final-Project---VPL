student_files="student_folder"
teacher_files="teacher_folder"
requested_file="OrgChart.zip" # Name of the file containing student input, must be change to the same name in the requested file
commit_teacher="f40446d"
teacher_link="https://github.com/itay-kar/orgchart-b_test.git" # Link to teacher's git repository

unzip "$requested_file" -d "$student_files"
git clone --quiet "$teacher_link" "$teacher_files"
cd "$teacher_files"
git checkout "$commit_teacher"
cd ..

find "$student_files" -type f -exec cp -n {} "$teacher_files" \;
find "$student_files" -exec cp -nR {} "$teacher_files" \;
rm -f -r "$student_files"
mv "$teacher_files"/* ./
