#!/bin/bash

# Set user and email information
user_email="emailaddress@email.com"
user_name="Ivan"

# Creating the SSH key
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa

# Email to the user
echo "Hello $user_name, I'm sending you your public key"
echo "Please add this to your authorized keys file for secure access"
echo "Best regards,"
echo "Your Server" | mail -s "Your SSH Public Key" $user_email

echo "SSH key has been sent to $user_email."

