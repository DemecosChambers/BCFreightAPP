Technical Documentation: Building and Deploying a Freight Web App on AWS with Terraform
This document provides a comprehensive guide to building a basic freight web application and deploying it on AWS using Terraform. The application allows freight brokers to submit truck load information through a web form, with the potential for future integration with email notifications and other features.
Project Goal:
To create a cost-effective, highly available, and disaster-tolerant web application on AWS for managing freight load information.
Technology Stack:
Front-end: HTML, CSS, JavaScript (basic form with potential for future client-side enhancements)
Back-end: Node.js with Express (simple web server to serve the front-end)
Infrastructure as Code (IaC): Terraform (for provisioning and managing AWS resources)
Cloud Platform: AWS (using EC2, VPC, RDS, Security Groups)
Development Environment:
Windows machine with PowerShell
Code editor (e.g., Visual Studio Code)
Git for version control (optional, but recommended)
AWS account with appropriate permissions
Step-by-Step Instructions:
1. Set up the Development Environment:



*   Install Node.js and npm:
    *   Download and install Node.js from the official website ([https://nodejs.org/](https://nodejs.org/)). This will also install npm (Node Package Manager).
*   Install Express:
    *   Open your terminal or PowerShell and run: `npm install express`


2. Create the Web Application:



*   Create Project Directory: Create a new folder for your project (e.g., "FreightWebApp").
*   Develop the Front-end:
    *   Create `index.html`: This will contain your HTML form for collecting freight information (origin, destination, weight, commodity). You can add basic CSS and JavaScript for styling and client-side validation.
    *   (Optional) Create `styles.css` and `script.js` for more advanced styling and front-end functionality.
*   Develop the Back-end:
    *   Create `index.js`: This file will contain your Node.js/Express server code.

    ```javascript
    const express = require('express');
    const app = express();
    const port = 3000; // You can change the port if needed

    // Serve the HTML file
    app.get('/', (req, res) => {
      res.sendFile(__dirname + '/index.html');
    });

    // Start the server
    app.listen(port, () => {
      console.log(`Server listening on port ${port}`);
    });
    ```


3. Create the Terraform Infrastructure:



*   Install Terraform: Download and install Terraform from the official website ([https://www.terraform.io/](https://www.terraform.io/)).
*   Create Terraform Configuration Files: Create the following files in your project directory:

    *   `main.tf`: This file will contain the main Terraform configurations.
    *   `variables.tf`: This file will define variables for your infrastructure (e.g., instance types, AMI IDs).
    *   `terraform.tfvars`: This file will store the values for your variables (including sensitive data like database passwords).
    *   Create a `modules` folder: This folder will contain subfolders for each module (e.g., `vpc`, `ec2`, `rds`, `security_groups`). Each module folder will have its own `main.tf`, `variables.tf`, and `outputs.tf` files.
    *   Create a `user_data` folder: This folder will contain your shell scripts (e.g., `web_server.sh`) for provisioning EC2 instances.

*   Write Terraform Code:
    *   Define your infrastructure in `main.tf`, using modules to organize your code.
    *   Create a VPC with public and private subnets in two availability zones (AZs) for high availability.
    *   Define security groups to control traffic between different tiers.
    *   Launch EC2 instances for the web server and application server tiers in both AZs.
    *   Create a multi-AZ RDS database instance for data persistence and high availability.
    *   Use the `user_data` script to install Node.js, download the web app code from your Git repository (if applicable), and start the Node.js server on your web server instances.


4. Deploy the Infrastructure:



*   Initialize Terraform: Run `terraform init` to initialize the working directory.
*   Plan the Deployment: Run `terraform plan` to preview the changes Terraform will make.
*   Apply the Deployment: Run `terraform apply` to create the infrastructure in your AWS account.


5. Verify the Deployment:



*   Check the AWS Management Console to verify that all resources have been created correctly.
*   Obtain the public IP address of one of your web server instances.
*   Access your web application in a browser using the public IP address.


Summary:
This documentation provides a step-by-step guide to building and deploying a basic freight web application on AWS using Terraform. It covers the key aspects of front-end and back-end development, infrastructure provisioning, and deployment. This foundation can be further expanded to include more advanced features and functionalities.
Additional Notes:
Ensure your AWS credentials are configured correctly for Terraform to access your account.
Use appropriate instance types and storage sizes to optimize costs.
Implement security best practices to protect your application and data.
Consider using version control (e.g., Git) to track changes to your code and infrastructure.
This documentation provides a basic framework. You can customize and enhance the application and infrastructure to meet your specific requirements.

