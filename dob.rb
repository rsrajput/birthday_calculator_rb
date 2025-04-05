require 'date'

# Ask for user's birthday
print "Welcome to birthday calculator"
print "\n\nPlease enter your name: "
name = gets.chomp
print "Welcome #{name.capitalize}"
print "\n\nEnter your birthday (YYYY-MM-DD): "
input = gets.chomp

begin
  birthday = Date.parse(input)
  today = Date.today

  if birthday > today
    puts "You entered a future date. Please enter a valid past date."
  else
    # Age in days and years
    age_in_days = (today - birthday).to_i
    age_in_years = (age_in_days / 365.25).floor

    # This year's birthday
    current_year_birthday = Date.new(today.year, birthday.month, birthday.day) rescue nil

    if current_year_birthday.nil?
      puts "Invalid date (possibly Feb 29 on a non-leap year). Try a valid date."
      exit
    end

    # Determine last and next birthday
    if current_year_birthday <= today
      last_birthday = current_year_birthday
      next_birthday = current_year_birthday.next_year
    else
      last_birthday = current_year_birthday.prev_year
      next_birthday = current_year_birthday
    end

    days_since_last_birthday = (today - last_birthday).to_i
    days_to_next_birthday = (next_birthday - today).to_i

    # Display output
    puts "\n🎉 You are approximately #{age_in_years} years old."
    puts "📅 That's around #{age_in_days} days old."
    puts "🔁 Days since your last birthday: #{days_since_last_birthday} days."
    puts "🎯 Days until your next birthday: #{days_to_next_birthday} days."
    puts ""
  end

rescue ArgumentError
  puts "Invalid date format. Please enter in YYYY-MM-DD format."
end
