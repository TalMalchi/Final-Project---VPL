
student_files="student_folder"
teacher_files="teacher_folder"
requested_file="Notebook-a.zip" #must be change to the same name in the requested file
teacher_link="https://github.com/cpp-exercises-5782/notebook-a.git" #link to teacher's git repository

unzip $requested_file -d $student_files
git clone --quiet $teacher_link $teacher_files
find $student_files -type f -exec cp -n {} $teacher_files \;
mv  $teacher_files/* ./