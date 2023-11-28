helm repo add runatlantis https://runatlantis.github.io/helm-charts

helm inspect values runatlantis/atlantis > values.yaml

oc new-project atlantis

kubectl apply -f .\provisioning-secrets.yaml

helm upgrade --install atlantis runatlantis/atlantis -f values.yaml

Go to: https://atlantis.apps.ocp-hashicorp-demo.aws.elostech.cz/github-app/setup

