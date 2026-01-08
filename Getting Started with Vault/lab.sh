sudo apt update && sudo apt install -y curl gnupg lsb-release
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update
sudo apt-get install vault
vault
vault server -dev


# new Cloud shell lab
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN="<REPLACE WITH YOUR ROOT TOKEN>"
vault status
vault kv get secret/hello
vault kv put secret/hello foo=world
vault kv put secret/hello foo=world excited=yes
vault kv get secret/hello
vault kv get -field=excited secret/hello
vault kv get -field=foo secret/hello
vault kv get -format=json secret/hello | jq -r .data.data.excited
vault kv get -format=json secret/hello | jq -r .data.data.excited > secret.txt
export PROJECT_ID=$(gcloud config get-value project)
gsutil cp secret.txt gs://$PROJECT_ID
vault kv delete secret/hello
vault kv put secret/example test=version01
vault kv put secret/example test=version02
vault kv put secret/example test=version03
vault kv get -version=2 secret/example
vault kv delete -versions=2 secret/example
vault kv undelete -versions=2 secret/example
vault kv destroy -versions=2 secret/example
vault kv get -version=2 secret/example
vault kv put foo/bar a=b
vault secrets enable -path=kv kv
vault secrets enable kv
vault secrets list
vault kv put kv/hello target=world
vault kv get kv/hello
vault kv put kv/my-secret value="s3c(eT"
vault kv get kv/my-secret
vault kv get -format=json kv/my-secret | jq -r .data.value > my-secret.txt
export PROJECT_ID=$(gcloud config get-value project)
gsutil cp my-secret.txt gs://$PROJECT_ID
vault kv delete kv/my-secret
vault kv list kv/
vault secrets disable kv/
vault token create
vault login <your token>
vault token create
vault token revoke <your token>
vault login <your token>
vault auth enable userpass
vault auth enable -path=my-login userpass
vault auth disable userpass
vault auth enable userpass
vault write auth/userpass/users/admin password=password! policies=admin
vault login -method=userpass username=admin password=password!

#Follow the instruction in app

echo '<your string>' | base64 --decode > decrypted-string.txt
cat decrypted-string.txt
export PROJECT_ID=$(gcloud config get-value project)
gsutil cp decrypted-string.txt gs://$PROJECT_ID
