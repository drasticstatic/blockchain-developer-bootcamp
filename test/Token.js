const { expect } = require('chai');
const { ethers } = require('hardhat');

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe('Token', () => {
  let token, accounts, deployer, receiver
  /*
    Added receiver variable to hold the second account
    This will be used to test the transfer function
    The receiver is the account that will receive the tokens
  */

  beforeEach(async () => {
    const Token = await ethers.getContractFactory('Token')
    token = await Token.deploy('Dapp University', 'DAPP', '1000000')

    accounts = await ethers.getSigners()
    deployer = accounts[0]
    receiver = accounts[1]
    //The receiver is the second account '[1]' in the list of signers
    //The deployer is the first account '[0]' in the list of signers
  })

  describe('Deployment', () => {
    const name = 'Dapp University'
    const symbol = 'DAPP'
    const decimals = '18'
    const totalSupply = tokens('1000000')

    it('has correct name', async () => {
      expect(await token.name()).to.equal(name)
    })

    it('has correct symbol', async () => {
      expect(await token.symbol()).to.equal(symbol)
    })

    it('has correct decimals', async () => {
      expect(await token.decimals()).to.equal(decimals)
    })

    it('has correct total supply', async () => {
      expect(await token.totalSupply()).to.equal(totalSupply)
    })

    it('assigns total supply to deployer', async () => {
      expect(await token.balanceOf(deployer.address)).to.equal(totalSupply)
    })

  })

// ==================== ADD TRANSFER DESCRIBE BLOCK BELOW 4 TRANSFER FUNCTION ====================

  describe('Sending Tokens', () => {
    let amount, transaction, result

    describe('Success', () => {
      // If successful, the transfer function will emit a Transfer event

      beforeEach(async () => {
        amount = tokens(100)
        transaction = await token.connect(deployer).transfer(receiver.address, amount)
        result = await transaction.wait()
      })

      it('transfers token balances', async () => {
        // Log balance before transfer
        // Ensure token transfer was successful (balance was updated)
        // Check the balance of the deployer and receiver
        expect(await token.balanceOf(deployer.address)).to.equal(tokens(999900))
        expect(await token.balanceOf(receiver.address)).to.equal(amount)
      })

      it('emits a Transfer event', async () => {
        // Log balance after transfer
        const event = result.events[0]
        expect(event.event).to.equal('Transfer')
        // Check the event aruments
        const args = event.args
        expect(args.from).to.equal(deployer.address)
        expect(args.to).to.equal(receiver.address)
        expect(args.value).to.equal(amount)
      })

    })

    
    describe('Failure', () => {
      // If the transfer fails, the transaction will be reverted
      // The transfer function will revert if the sender does not have enough tokens
      it('rejects insufficient balances', async () => {
            //  Linked to <require(_to != address(0));> in Token.sol
        // Attempt to transfer tokens from the deployer to the receiver
         // The deployer has 1000000 (1M) tokens, so this transfer should fail
        const invalidAmount = tokens(100000000) //100M
        await expect(token.connect(deployer).transfer(receiver.address, invalidAmount)).to.be.reverted
      })

      it('rejects invalid recipent', async () => {
          // Linked to <require(_to != address(0));> in Token.sol//
        // Attempt to transfer tokens to the zero address
        // The zero address is an invalid address, so this transfer should fail
        const amount = tokens(100)
        await expect(token.connect(deployer).transfer('0x0000000000000000000000000000000000000000', amount)).to.be.reverted
      })

    })

  })

})
