#Test Cases:
# 79927398710 - Invalid
# 79927398711 - Invalid
# 79927398712 - Invalid
# 79927398713 - Valid
# 79927398714 - Invalid
# 79927398715 - Invalid
# 79927398716 - Invalid

number = 0
#Validation Loop
loop do

	puts "Please input a number for validation:"
	
	number = gets.chomp

	#Simple regex check for an string of exactly eleven digits
	if number.match('\A\d{11}\z')

		puts "You have input " + number
		break

	else

		puts "Invalid number format, please provide an eleven digit number."

	end

end

#Converting to array of digits so that it can be used with .each
number_list = number.chars
check_digit = number_list.pop

#Using a boolean that gets reversed every iteration to keep track of doubling
#Also note use of reverse_each, because we need to start process from right to left
double_digit = true
luhn_total = 0
number_list.reverse_each do |n|

	#Gonna convert to int here to avoid any complications
	n = n.to_i

	#Almost forgot, have to include check for greater than 9 here
	if double_digit == true
		
		n = n * 2

		if n > 9

			n = n - 9

		end

		double_digit = false

	else

		double_digit = true

	end

	#Debugging
	#puts "N: " + n.to_s

	luhn_total += n

end

#Finally, need to add the check_digit to get the final total
luhn_total = luhn_total + check_digit.to_i

#Debugging
#puts "Luhn Total: " + luhn_total.to_s

#Final results provided
if luhn_total%10 == 0

	puts number + " is valid according to the Luhn Algorithm."

else

	puts number + " is invalid according to the Luhn Algorithm."
	
end

