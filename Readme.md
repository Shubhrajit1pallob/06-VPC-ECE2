# VPC and EC2 Project

## Overview

This project demonstrates how to deploy a Virtual Private Cloud (VPC) and an EC2 instance using Terraform. The setup includes creating essential networking components, configuring security groups, and launching an EC2 instance with a publicly available NGINX AMI.

## Steps to Follow

1. **Deploy a VPC and a Subnet**:
   - Create a VPC with a specified CIDR block.
   - Add a public subnet to the VPC.

2. **Deploy an Internet Gateway (IGW)**:
   - Create an Internet Gateway and associate it with the VPC.

3. **Set Up a Route Table**:
   - Create a route table with a route to the Internet Gateway.
   - Associate the route table with the public subnet.

4. **Create an EC2 Instance**:
   - Launch an EC2 instance inside the created subnet.
   - Assign a public IP address to the instance.

5. **Configure Security Groups**:
   - Create a security group that allows public ingress traffic for HTTP (port 80) and HTTPS (port 443).
   - Attach the security group to the EC2 instance.

6. **Use a Publicly Available NGINX AMI**:
   - Change the EC2 instance to use a free, publicly available NGINX AMI.

7. **Clean Up Resources**:
   - Destroy all resources to avoid incurring unnecessary charges from AWS.

## Prerequisites

- Terraform installed on your local machine (version 1.0.0 or later).
- AWS CLI configured with appropriate credentials and permissions.
- An AWS account with access to create networking and compute resources.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd 06-Resources
   ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Review the execution plan:

    ```bash
    terraform plan
    ```

4. Apply the configuration to create resources:

    ```bash
    terraform apply
    ```

5. Verify the EC2 instance is running and accessible via its public IP.

6. Destroy the resources to avoid unnecessary costs:

    ```bash
    terraform destroy
    ```

## Notes

- Ensure the AMI ID used for the EC2 instance is valid and available in your AWS region.
- Always review the execution plan before applying changes to avoid unintended modifications.
- Use proper IAM permissions to allow Terraform to create and manage resources.

## Project Structure

- networking.tf: Contains the VPC, subnet and the IGW configuration, as well as the routing configuration.
- compute.tf: Contains the EC2 instance and related security groups configurations.
- provider.tf: Configures the AWS provider.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
