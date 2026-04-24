param name string
param location string
param prefix string

resource vnet 'Microsoft.Network/virtualNetworks@2023-08-01' = {
  name: '${prefix}-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets01: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
    subnets02:[
      {
        name: 'kv-subnet'
        properties: {
          addressPrefix: '10.1.2.0/24'
        }
      }
    ] 
  }
}
