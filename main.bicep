targetScope = 'resourceGroup'

param location string = resourceGroup().location
param env string
param prefix string

module monitoring './modules/monitoring.bicep' = {
  name: 'monitoring'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module kv './modules/keyvault.bicep' = {
  name: 'keyvault'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module sql './modules/sql.bicep' = {
  name: 'sql'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module app './modules/appservice.bicep' = {
  name: 'app'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}
