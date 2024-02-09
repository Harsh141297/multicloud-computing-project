# Purpose of this Folder

This folder should contain the scaffolded project files to get a student started on their project. This repo will be added to the Classroom for students to use, so please do not have any solutions in this folder.


Selecting the right cloud provider for each service involves evaluating the offerings from major players such as AWS, Azure, and Google Cloud Platform (GCP), among others. Let's break down the selection based on your requirements:

## SQL Server
Requirements:
- At least 2 vCPU
- 150GB of storage
- Migrating an existing SQL server instance
- Bring your own SQL licensing
Azure might be the best fit for SQL Server, specifically using Azure SQL Database or Azure VMs for SQL Server. Azure offers an easy migration path for existing SQL Server instances with its Azure Migrate service. Additionally, Azure supports the "bring your own license" (BYOL) model for SQL Server, which can reduce costs if you already own SQL Server licenses. Azure VMs can be customized to meet the vCPU and storage requirements.

## S3 Storage
Requirements:
- Full S3 API capability
- Global replication
AWS S3 is the native choice here due to its comprehensive S3 API support and mature global replication capabilities. AWS S3 offers a robust, secure, and scalable infrastructure for storing and retrieving any amount of data from anywhere in the world. While other providers offer S3-compatible services, AWS's S3 is the gold standard for these features.

## NoSQL Database
Requirements:
- Global availability
- Highly scalable pricing
For applications requiring a highly scalable, globally available NoSQL database within the AWS ecosystem, Amazon DynamoDB is an excellent choice.

## Web App
Requirements:
- Hosting an existing dotnet application
- Not a static website
- Contains container groups
Azure App Service is highly recommended for hosting .NET applications due to its native support for .NET and its integration with Visual Studio and other Microsoft development tools. Azure App Service supports containerized applications, offering both Windows and Linux containers. This makes it a suitable platform for your dotnet application, especially considering the existing container groups. Azure's flexibility in scaling and pricing options can also accommodate the specific needs of your application.

## Conclusion
- SQL Server: Azure (Azure SQL Database or Azure VMs for SQL Server)
- S3 Storage: AWS (S3)
- NoSQL Database: AWS (Amazon DynamoDB)
- Web App: Azure (App Service)