// ==================== IMPORTS SECTION ====================
// These are the libraries we need to import for testing our smart contract

const { expect } = require('chai');
// ↑ The 'expect' function from Chai is used for making assertions in our tests
// Assertions are statements that check if a condition is true (e.g., expect(x).to.equal(y))

const { ethers } = require('hardhat');
// ↑ Ethers.js is a library that allows JavaScript to interact with the Ethereum blockchain
// We import it from Hardhat, which is our development environment

// ==================== HELPER FUNCTIONS ====================

/**
 * Helper function to convert a number to token amount with proper decimals
 * @param {number} n - The number of tokens (e.g., 1000)
 * @returns {BigNumber} - The token amount with 18 decimals (e.g., 1000 * 10^18)
 */
const tokens = (n) => {
  // parseUnits converts a human-readable number to the smallest unit (wei)
  // 'ether' means we're using 18 decimals (1 ether = 10^18 wei)
  return ethers.utils.parseUnits(n.toString(), 'ether')
  // For example: tokens(1000) returns 1000000000000000000000 (1000 with 18 zeros)
}

// ==================== MAIN TEST SUITE ====================

// 'describe' is a Mocha function that groups related tests together
// Think of it as a test container or a test category
describe('Token', () => {
  // Variables accessible to all tests in this describe block
  let token; // Will hold the deployed token contract instance

  // 'beforeEach' runs before each test in this describe block
  // This is where we set up the environment for each test
  beforeEach(async () => {
    // Deploy a fresh instance of our Token contract before each test

    // Get the Token contract factory (blueprint)
    // This allows us to deploy new instances of the contract
    const Token = await ethers.getContractFactory('Token')

    // Deploy the contract with constructor arguments:
    // 1. Name: 'Dapp University'
    // 2. Symbol: 'DAPP'
    // 3. Total Supply: '1000000'
    token = await Token.deploy('Dapp University', 'DAPP', '1000000')

    // Now 'token' is a deployed instance of our contract that we can interact with
  })

  // ==================== DEPLOYMENT TESTS ====================

  // Nested describe block for tests related specifically to deployment
  describe('Deployment', () => {
    // Expected values that our token should have after deployment
    // We'll compare these with the actual values from the contract
    const name = 'Dapp University'
    const symbol = 'DAPP'
    const decimals = '18'
    const totalSupply = tokens('1000000') // Convert 1,000,000 to wei (with 18 decimals)

    // ==================== INDIVIDUAL TEST CASES ====================

    // 'it' defines an individual test case
    // Each 'it' block tests one specific aspect of our contract
    it('has correct name', async () => {
      // Call the name() function on our token contract
      // Compare the result with our expected name using Chai's expect
      expect(await token.name()).to.equal(name)

      // This test passes if the token's name matches 'Dapp University'
    })
    // Log the token name to the console for debugging/information
    console.log(`token name: ${name}`)

    it('has correct symbol', async () => {
      // Test that the token's symbol matches our expected symbol
      expect(await token.symbol()).to.equal(symbol)
    })
    console.log(`token symbol: ${symbol}`)

    it('has correct decimals', async () => {
      // Test that the token's decimals matches our expected decimals
      expect(await token.decimals()).to.equal(decimals)
    })
    console.log(`token decimals: ${decimals}`)

    it('has correct total supply', async () => {
      // Test that the token's total supply matches our expected total supply
      // totalSupply() returns a BigNumber, which is compared with our expected value
      expect(await token.totalSupply()).to.equal(totalSupply)
    })
    console.log(`total supply: ${totalSupply}`)

    // Note: When these tests run, Hardhat creates a local Ethereum network
    // and deploys our contract to it. After the tests complete, this network is destroyed.
  })

  // ==================== FUTURE TEST SECTIONS ====================
  // As you develop more functionality in your Token contract, you would add more
  // test sections here, such as:

  // describe('Token Transfers', () => {
  //   // Tests for transfer functionality
  // })

  // describe('Token Approvals', () => {
  //   // Tests for approval functionality
  // })
})
