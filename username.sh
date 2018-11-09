echo "A username must have only lower case letters/digits/underscores."
echo "Also, it must begin with a lowercase letter and be between 3 and 12 characters"
echo "Enter in a username: "
read user
while echo $user | egrep --invert-match "([a-z]|[0-9]|[_])$" > /dev/null 2>&1
do
	echo "Contains invalid characters!"
	read user
done
first=${user:0:1}
length=`expr length $user`

while [[ $length -lt 3 || $length -gt 12 ]]
do
	echo "It must be between 3 and 12 characters!"
	read user
	length=`expr length $user`
done

until [[ "$first" =~ [a-z] ]]
do
	echo "The first character must be a lowercase letter!"
	read user
	first=${user:0:1}
done
echo "done"
