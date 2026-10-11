#!/bin/bash
# Basic arithmetic calculator
# Asks for two numbers and prints the result of all four operations

# Ask the user for two numbers and store them in variables
read -p "Enter first number: " num1
read -p "Enter second number: " num2

echo ""
echo "Results:"

# $(( )) is arithmetic expansion, it does the maths inside the brackets
echo "$num1 + $num2 = $((num1 + num2))"
echo "$num1 - $num2 = $((num1 - num2))"
echo "$num1 × $num2 = $((num1 * num2))"

# Division by zero crashes the calculation, so check for it first
if [ "$num2" -eq 0 ]; then
    echo "$num1 ÷ $num2 = Error: cannot divide by zero"
else
    echo "$num1 ÷ $num2 = $((num1 / num2))"
fi
