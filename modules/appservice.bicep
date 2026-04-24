param location string
param env string
param prefix string

resource plan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: 'asp-${prefix}-${env}'
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
  properties: {
  }
}

resource app 'Microsoft.Web/sites@2024-04-01' = {
  name: 'app-${prefix}-${env}'
  location: location
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
  }
}


