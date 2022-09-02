# These are the usual cloud (AWS) variables.
PROJECT       ?= 
REGION        ?= us-east-2
CLUSTER       ?= 

.PHONY: update-config update-plugins update-labels get-cluster-credentials

all: update-config update-plugins update-labels

update-config:
	oc create configmap -n default config --from-file=config.yaml=configs/config.yaml --dry-run -o yaml | kubectl replace configmap config -f -

update-plugins:
	oc create configmap -n default plugins --from-file=plugins.yaml=configs/plugins.yaml --dry-run -o yaml | kubectl replace configmap plugins -f -

update-labels:
	oc create configmap -n default label-config --from-file=labels.yaml=configs/labels.yaml --dry-run -o yaml | kubectl replace configmap plugins -f -

#get-cluster-credentials:
#	ocm clusters get-credentials "$(CLUSTER)" --project="$(PROJECT)" --zone="$(ZONE)"
