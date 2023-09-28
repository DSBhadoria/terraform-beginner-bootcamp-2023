# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module project is as follows -
```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variales

### Terraform Cloud Variables

- Environment Variables - Alike those set in the bash teriminal i.e. AWS Credentials
- Terraform Variables   - Alike those set in the tfvars file

Note: Terraform cloud variables can set as sensitive, so that their values remain hidden on the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

#### var flag
- Input variables can be set or override using the `-var` flag, present in the `terraform.tfvars` file. eg. `terraform plan -var user_uuid="my_user_id"`

##### var-file flag
TODO: To be updated later

#### terraform.tfvars
Default file to load in the terraform variables

#### auto.tfvars
TODO: TO be updated later

#### Order of Terraform Variables
TODO: Document the terraform variables ordering precedency