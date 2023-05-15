student_files="student_folder"
requested_file="link_py.txt" #must be change to the same name in the requested file


git clone --quiet $(cat $requested_file) $student_files
mv $student_files/* ./
