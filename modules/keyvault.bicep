param location string
param env string
param prefix string

var kvName = 'kv-${prefix}-${env}-${take(uniqueString(subscription().subscriptionId, resourceGroup().name), 4)}'

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: kvName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enabledForDeployment: true
    enableRbacAuthorization: true
    enablePurgeProtection: true
    accessPolicies: []
  }
}

output keyVaultName string = kv.name
output keyVaultId string = kv.id
