
  module.exports = {
    networks: {
      development: {
        host: "127.0.0.1",
        port: 8545,
        network_id: "*", // Match any network id
        from: " 0x4B59b1Cb4b059295b047Fe9Ab9A61C9Ae58fE5C8"
      }
    },
    solc: {
      optimizer: {
        enabled: true,
        runs: 200,
        
      }
    }
  }