# GCP web server Terraform

This example deploys a basic Google Cloud web server using reusable Terraform modules:

- A custom VPC and subnet.
- Firewall rules that allow public HTTP traffic and SSH only through Identity-Aware Proxy (IAP).
- Two Debian 12 Compute Engine VMs running Nginx in the same VPC and subnet.

## Layout

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
└── modules
    ├── network
    └── webserver
```

The `network` module creates the VPC, subnet, and firewall rules. The `webserver`
module creates a VM in the supplied subnet; it can also be reused with a different
network module or subnet.

## Prerequisites

- Terraform 1.5 or newer.
- A Google Cloud project with billing enabled and the Compute Engine API available.
- Google Cloud credentials configured for Terraform, for example with
  `gcloud auth application-default login`.
- Permission to create VPC networks, firewall rules, and Compute Engine instances.

## Deploy

Run these commands from the repository root:

```shell
terraform init
terraform fmt -recursive
terraform validate
terraform plan -var="project_id=YOUR_GCP_PROJECT_ID"
terraform apply -var="project_id=YOUR_GCP_PROJECT_ID"
```

After apply, Terraform prints `webserver_url` and `webserver_2_url`. Open either
URL after the VM startup script has finished installing Nginx.

To customize the region, zone, subnet CIDR, or machine type, pass additional
`-var` arguments or create a `terraform.tfvars` file. Do not commit credentials
or other secrets in that file.

## Network access

- TCP port 80 is open to the internet so the web page can be reached.
- TCP port 22 is allowed only from Google's IAP TCP forwarding range
  (`35.235.240.0/20`). To SSH through IAP, the operator also needs the relevant
  IAM permissions and `gcloud` configured for the project.
- The VM has an ephemeral public IP for serving the HTTP page.

## Clean up

Run `terraform destroy -var="project_id=YOUR_GCP_PROJECT_ID"` to remove the
resources created by this example.
