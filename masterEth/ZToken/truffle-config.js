// Install dependencies:
// npm init
// npm install --save-dev dotenv truffle-wallet-provider ethereumjs-wallet

// Create .env in project root, with keys:
ROPSTEN_PRIVATE_KEY="90b8ba7b3adb4f6dcf17eeab4db0325d6adf8c8e4089bbb2555a97698bafd1ee"
MAINNET_PRIVATE_KEY="90b8ba7b3adb4f6dcf17eeab4db0325d6adf8c8e4089bbb2555a97698bafd1ee"

// require('dotenv').config();
const Web3 = require("web3");
const web3 = new Web3();
const web3_utils = require('web3-utils');
const WalletProvider = require("truffle-wallet-provider");
const Wallet = require('ethereumjs-wallet');

var mainNetPrivateKey = Buffer.from(MAINNET_PRIVATE_KEY,"hex");
var mainNetWallet = Wallet['default'].fromPrivateKey(mainNetPrivateKey);
var mainNetProvider = new WalletProvider(mainNetWallet, "https://mainnet.infura.io/");

var ropstenPrivateKey = Buffer.from(ROPSTEN_PRIVATE_KEY, "hex");
var ropstenWallet = Wallet['default'].fromPrivateKey(ropstenPrivateKey);
var ropstenProvider = new WalletProvider(ropstenWallet, "https://ropsten.infura.io/");
/**
 * Use this file to configure your truffle project. It's seeded with some
 * common settings for different networks and features like migrations,
 * compilation and testing. Uncomment the ones you need or modify
 * them to suit your project as necessary.
 *
 * More information about configuration can be found at:
 *
 * trufflesuite.com/docs/advanced/configuration
 *
 * To deploy via Infura you'll need a wallet provider (like @truffle/hdwallet-provider)
 * to sign your transactions before they're sent to a remote public node. Infura accounts
 * are available for free at: infura.io/register.
 *
 * You'll also need a mnemonic - the twelve word phrase the wallet uses to generate
 * public/private key pairs. If you're publishing your code to GitHub make sure you load this
 * phrase from a file you've .gitignored so it doesn't accidentally become public.
 *
 */

// const HDWalletProvider = require('@truffle/hdwallet-provider');
// const infuraKey = "fj4jll3k.....";
//
// const fs = require('fs');
// const mnemonic = fs.readFileSync(".secret").toString().trim();

module.exports = {
  /**
   * Networks define how you connect to your ethereum client and let you set the
   * defaults web3 uses to send transactions. If you don't specify one truffle
   * will spin up a development blockchain for you on port 9545 when you
   * run `develop` or `test`. You can ask a truffle command to use a specific
   * network from the command line, e.g
   *
   * $ truffle test --network <network-name>
   */

  networks: {
		dev: { // Whatever network our local node connects to
			network_id: "10086", // Match any network id
			host: "localhost",
			port: 8545,
		},
		mainnet: {  // Provided by Infura, load keys in .env file
			network_id: "1",
			provider: mainNetProvider,
			gas: 4600000,
			gasPrice: web3_utils.toWei("20", "gwei"),
		},
		ropsten: { // Provided by Infura, load keys in .env file
			network_id: "3",
			provider: ropstenProvider,
			gas: 4600000,
			gasPrice: web3_utils.toWei("20", "gwei"),
		}
	},

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      // version: "0.5.1",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    }
  },

  // Truffle DB is currently disabled by default; to enable it, change enabled: false to enabled: true
  //
  // Note: if you migrated your contracts prior to enabling this field in your Truffle project and want
  // those previously migrated contracts available in the .db directory, you will need to run the following:
  // $ truffle migrate --reset --compile-all

  db: {
    enabled: false
  }
};




