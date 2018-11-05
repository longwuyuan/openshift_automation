# Ansible Automation for okd.io

- Ansible version 2.7 required
- Ansible module https://docs.ansible.com/ansible/latest/modules/k8s_module.html#openshift-raw-module
- Dependency "pip install openshift --user"
- Authentication tips https://github.com/ansible/ansible/issues/47556
- Auth example


  ```
  k8s:
    kubeconfig: admin.kubeconfig
    context: default/127-0-0-1:8443/system:admin
    kind:
  ```

- Refer the roles for details

# Authentication Gateway/Proxy

- All requests to api endpoint are authenticated and authorised.
After enabling SSL with letsencrypt, deploy Kong. But it there are enough resources, then deploy Istio.

- Solution should be highly available and redundant.
    run more than 1 replica

- Authorisation logic should be managed by the application.
    client token should be generated with application level ACL

- Authentication accounts would be managed by the client side application.
    Client app should have a registration on the app as first factor and only registered clients should be able to generate access tokens tha the endpoints honor


# Continues Integration & Deployment

- All developers code on laptop and use a personal branch and a OKD cluster
- Ansible or other automation creates the cluster and the images
- Ansible or gitlab-ci/drone-ci/jenkins deploys each developer's build to his own OKD cluster
- The PMs/Leads own and controls a integration branch and developers can not commit to integration
- Developers submit PR to PM for the integration branch
- Ansible/Jenkins creates integration cluster and deploys integration builds to it
- Delivery Lead owns the master branch and nobody else can commit to it
- PMs/Leads submit PR to master branch
- CI of chosen type creates images and blue/gree deployments
