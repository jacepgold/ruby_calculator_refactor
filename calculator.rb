# Jace P. Gold
# December 28, 2017
require 'colorize'

@equations = ['+', '-', '*', '/'] # Allowable operation types

def show_operations
    count = 0
    @equations.each do |current|
        puts current; 
    end
    puts "\n\n"
end


def check_input(input)
    input = input.upcase
    if input == 'Q'
        puts 'Entered Q to quit the application...'.red
        puts 'Thanks for using this Calculator!'.green
        exit
    end
end


def operations(type, num1, num2)
    type = type.upcase # Fallback incase a lowercase is sent through (incase, get it?)
    num1 = num1.to_f
    num2 = num2.to_f

    case type
    when 'ADD'
        answer = num1 + num2
        puts "Answer: #{answer}\n\n".green
    when 'SUB'
        answer = num1 - num2
        puts "Answer: #{answer}\n\n".green
    when 'MULT'
        answer = num1 * num2
        puts "Answer: #{answer}\n\n".green
    when 'DIV'
        if num1 && num2 == 0
            puts "ERROR: Cannot Divide by Zero\n\n".red
        else
            answer = num1 / num2
            puts "Answer: #{answer}".green
        end
    else
        puts 'ERROR: Unknown Method'.red
    end
end


def calculator
    puts '------ Welcome to Ruby Calculator! ------'
    puts "Operations include:"

    show_operations

    puts '"q" to quit at any time. '
    puts 'What is the first number?'
    print '> '
    first_num = $stdin.gets.strip
    check_input(first_num)

    puts 'What is the operator?'
    print '> '
    operator = $stdin.gets.strip
    check_input(operator)

    puts 'What is the second number?'
    print '> '
    second_num = $stdin.gets.strip
    check_input(second_num)

    if operator == '+'
        operations('ADD', first_num, second_num)
        calculator
    elsif operator == '-'
        operations('SUB', first_num, second_num)
        calculator
    elsif operator == '*'
        operations('MULT', first_num, second_num)
        calculator
    elsif operator == '/'
        operations('DIV', first_num, second_num)
        calculator
    else
        puts 'Invalid input. Please try again.'
        calculator
    end
end

calculator