oc create namespace examplepipeline
oc create -n examplepipeline -f https://raw.githubusercontent.com/openshift/origin/master/examples/jenkins/pipeline/nodejs-sample-pipeline.yaml
oc start-build nodejs-sample-pipeline
