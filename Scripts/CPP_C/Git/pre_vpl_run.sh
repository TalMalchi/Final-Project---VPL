student_files="student_folder"
teacher_files="teacher_folder"
requested_file="link.txt" #must be change tothe same name in the requsted file
teacher_link="https://github.com/cpp-exercises-5782/notebook-a.git" #link to teacher's git repository

git clone --quiet $(cat $requested_file) $student_files
git clone --quiet $teacher_link $teacher_files
find $student_files -type f -exec cp -n {} $teacher_files \;
mv  $teacher_files/* ./




