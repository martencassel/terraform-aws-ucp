# UCP Linux Worker Install Script

This folder contains a script for installing UCP Linux Worker and its dependencies on a server. It's supposed to be run from ucp-cluster module when setting up a
ucp node.

* This script has been tested on the following systems

* Red Hat Linux 7.4

## Command Line Arguments

The `install-ucp` script accepts the following arguments:

* `version VERSION`: Install UCP version VERSION. Required.
* `package_url PACKAGE_URL`: Package URL.
* `rhsm_username RHSM_USERNAME`: RHSM Username.
* `rhsm_password RHSM_PASSWORD`: RHSM Password.
* `admin_username ADMIN_USERNAME`: UCP Admin Username.
* `admin_password ADMIN_PASSWORD`: UCP Admin Password.
* `instance_id INSTANCE_ID`: Instance ID of current aws instance.
* `private_ip PRIVATE_IP`: Private IP of current aws instance.
* `manager_ip MANAGER_IP`: Manager IP of first aws instance.
* `manager_public_dns MANAGER_PUBLIC_DNS`: Manager Public DNS.

Example:
```
export PACKAGE_URL="https://storebits.docker.com/ee/rhel/sub-<subscription-id>/rhel/7.5/x86_64/stable-17.06/Packages/docker-ee-17.06.2.ee.16-3.el7.x86_64.rpm";

./install-ucp.sh --version "3.0.2" \
                 --package_url $PACKAGE_URL \
                 --rhsm_username "<rhsm-username>" \
                 --rhsm_password "<rhsm-password>" \
                 --admin_username "<ucp-username>" \
                 --admin_password "<ucp-password>" \
                 --instance_id "0" \
                 --private_ip "<server-private-ip>" \
                 --manager_ip "<manager-ip>" \
                 --manager_public_dns "<manager-public-dns>";

```