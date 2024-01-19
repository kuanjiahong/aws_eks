/kaniko/executor --context "$(S3_BUCKET_BUILD_CONTEXT)" \
 --dockerfile "$(SERVICE)/Dockerfile" \
 --destination "$(SERVICE_ECR_URL):$(BUILD_SOURCEVERSION)"