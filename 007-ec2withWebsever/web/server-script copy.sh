# # #!/bin/bash
# # sudo yum update
# # sudo yum install -y httpd
# # sudo systemctl start httpd
# # sudo systemctl enable httpd
# # echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html


# #!/bin/bash
# sudo apt update
# sudo apt install -y apache2
# sudo systemctl start apache2
# sudo systemctl enable apache2
# echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html


#!/bin/bash

# Start Apache web server
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# Create a default welcome message
echo "<!DOCTYPE html>
<html>
<head>
    <title>Welcome to My Website</title>
</head>
<body>
    <h1>Welcome to My Website</h1>
    <p>This is a default welcome message.</p>
</body>
</html>" | sudo tee /var/www/html/index.html

# Restart Apache to apply changes
sudo systemctl restart apache2

echo "Apache web server started successfully. You can access your website at http://your_server_ip"

#!/bin/bash
yes | sudo apt update
yes | sudo apt install apache2
