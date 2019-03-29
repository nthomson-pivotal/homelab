# Ubuntu Template Builder

This is a Packer build for creating an Ubuntu template in a vCenter environment. This template is fed to Terraform configuration to automate creation of various pieces of infrastructure.

It will:

- Create an Ubuntu 16.04 VM
- Load on VMWare Tools

The default login in `ubuntu/ubuntu`.

## Pre-requisites

The following are required:

- Packer
- vSphere Packer ISO plugin
- vCenter server with at least one vSphere host
- Ubuntu ISO uploaded to vSphere server datastore
