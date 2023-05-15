student_files="student_folder"
requested_file="Ex8.zip" #must be change to the same name in the requested file


unzip $requested_file -d $student_files
mv $student_files/* ./


