param location string
param env string
param prefix string

var appSuffix = take(uniqueString(subscription().subscriptionId, resourceGroup().name, env), 6)
var planName = 'asp-${prefix}-${env}-${appSuffix}'
var appName = 'app-${prefix}-${env}-${appSuffix}'

resource plan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: planName
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
  properties: {
  }
}

resource app 'Microsoft.Web/sites@2024-04-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
  }
}


