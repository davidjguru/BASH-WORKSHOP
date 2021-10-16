#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with variables in bash scripting: User-defined variables - Arrays. 
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Variables Bash Script V2
# Description: Second script using variables, now with arrays.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

# Creating a new variable as an indexed array.
my_array=(1 2 3 4 5 'six' 'seven' 8 9 'ten') # Load values in a variable.

echo "The First item in array:"
echo $my_array # Will print only the first item in array. 

echo "First Item one more time: "
echo ${my_array[0]} # Will print the first item, arrays are zero index.

echo "Now it will print the sixth item in array: "
echo ${my_array[5]} # Will print the sixth item.

echo "Now we will print all the items in array: "
echo ${my_array[*]} # Will print all the values from the array. 

echo "Now we will get the length of the array (number of values): "
echo ${#my_array[@]} # Will print the size.

echo "Now we're looping over the values in array: "
for i in "${my_array[@]}"
do
	echo $i
done

echo "Now we're removing elements from the array, the third item."
unset my_array[2]
echo ${my_array[*]}

echo "Now unsetting all values in array."
unset my_array
echo "Current values: " ${my_array[*]}
echo "Current size: " ${#my_array[@]}

# But you can use the declare command, too.
echo "Now we're creating a new pair of arrays using 'declare' command."
declare -a indexed_array # Create a new basic array. 
declare -A associative_array # Create a new associative array. 

echo "Now we're gonna to populate the new arrays and show the values on them."
indexed_array=( I You He She It We You)
associative_array[keyone]="valueone"
associative_array[keytwo]="valuetwo"
echo "The indexed array values are: " ${indexed_array[@]}
echo "The associative array values are: " ${associative_array[@]}

echo "And now adding new values to the arrays." 
indexed_array+=(They)
associative_array+=([keythree]=valuethree [keyfour]=valuefour)
echo "The indexed array updated values are: " ${indexed_array[@]}
echo "The associative array updated values are: " ${associative_array[@]}




