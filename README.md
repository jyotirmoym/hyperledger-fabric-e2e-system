# Hyperledger Fabric End-to-End System in Amazon AWS
This is quick IaC driven automated setup of two organisations end to end hyperledger fabric system in Amazon AWS.
It involves the following AWS services and tools to bring up the entire application

* IaC - [Terraform](https://www.terraform.io/), [CloudFormation](https://aws.amazon.com/cloudformation/), [AWS SAM](https://aws.amazon.com/serverless/sam/)
* AWS Services - Amazon Managed Blockchain, API Gateway, AWS Lambda, AWS Amplify, VPC and its components
* Application Codebase - Java, Angular

# Components
Following are the components used support this end to end setup

* [hyperledger-fabric-chaincode](https://github.com/jyotirmoym/hyperledger-fabric-chaincode) — The smart contract
* [hyperledger-fabric-org1-api](https://github.com/jyotirmoym/hyperledger-fabric-org1-api) — The application API for first organisation
* [hyperledger-fabric-org2-api](https://github.com/jyotirmoym/hyperledger-fabric-org2-api) — The application API for second organisation
* [hyperledger-fabric-org1-ui](https://github.com/jyotirmoym/hyperledger-fabric-org1-ui) — The application UI for first organisation
* [hyperledger-fabric-org2-ui](https://github.com/jyotirmoym/hyperledger-fabric-org2-ui) — The application UI for second organisation


# Documentation
Following article details out how to use this repository to setup the entire Hyperledger Fabric Blockchain system

<a target="_blank" href="https://github-readme-medium-recent-article.vercel.app/medium/@jyotirmoy-mukherjee/0"><img src="https://github-readme-medium-recent-article.vercel.app/medium/@jyotirmoy-mukherjee/0" alt="Setup Hyperledger Fabric Blockchain Application in Amazon AWS"> 
