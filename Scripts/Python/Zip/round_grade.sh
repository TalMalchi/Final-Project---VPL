# Set the threshold for rounding up/down
# Set the threshold for rounding up/down
grade=$1
threshold=5

# Get the integer and fractional parts of the grade
int_part=${grade%.*}
frac_part=${grade#*.}

# Multiply the fractional part by 10 to get an integer value
frac_part_int=$(( frac_part * 10 ))

# Multiply the threshold by 10 to get an integer value
threshold_int=$(( threshold * 10 ))

# Check if the fractional part is greater than or equal to the threshold
if (( frac_part_int >= threshold_int )); then
  # Round up by adding 1 to the integer part
  (( int_part += 1 ))
else
  # Round down by keeping the integer part as is
  :
fi

# Set the rounded grade value
rounded_grade="$int_part"

# Print the rounded grade value
#echo "Rounded grade: $rounded_grade"
echo $rounded_grade
