targetScope = 'resourceGroup'

param location string = resourceGroup().location
param env string
param prefix string

module monitoring './modules/monitoring.bicep' = {
  name: 'monitoring-${deployment().name}'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module kv './modules/keyvault.bicep' = {
  name: 'keyvault-${deployment().name}'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module sql './modules/sql.bicep' = {
  name: 'sql-${deployment().name}'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module app './modules/appservice.bicep' = {
  name: 'app-${deployment().name}'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module vnet './modules/network.bicep' = {
  name: 'vnet-${deployment().name}'
  params: {
    location: location
    env: env
    prefix: prefix
  }
}

module kvPe './modules/privateendpoint-keyvault.bicep' = {
  name: 'keyvault-pe-${deployment().name}'
  params: {
    location: location
    keyVaultName: kv.outputs.keyVaultName
    vnetName: vnet.outputs.vnetName
    subnetName: vnet.outputs.peSubnetName
  }
}
