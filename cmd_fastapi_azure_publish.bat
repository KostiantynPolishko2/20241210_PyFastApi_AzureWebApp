az login

az upgrade

az group create --name fastapi-test-rg --location eastus

az acr create --resource-group fastapi-test-rg --name fastapitestcr --sku Basic

az acr build --resource-group fastapi-test-rg --registry fastapitestcr --image fastapi-test-im:v1.0.0 .

az appservice plan create --name fastapi-test-plan --resource-group fastapi-test-rg --sku B1 --is-linux

az webapp create --resource-group fastapi-test-rg --plan fastapi-test-plan --name fastapi-test -assign-identity [system] --role AcrPull --scope /subscriptions/7e9d458d-7130-4877-b549-e74c9aab486b/resourceGroups/web-app-simple-rg --acr-use-identity --acr-identity [system] -container-image-name fastapitestcr.azurecr.io/fastapi-test-im:v1.0.0