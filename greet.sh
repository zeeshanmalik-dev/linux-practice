if [ -z "$1" ]; then
    read -p "Enter your name: " name
else
    name="$1"
fi

echo "Hello $name"
