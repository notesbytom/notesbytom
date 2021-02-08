// Get ABI-Encoded Constructor Parameters for Compound CAP Proposal 36
// Remove 0x from beginning of output to paste into Etherscan contract code verifier
// Tricky things with validating a CAP, the contract is created by another contract
// We can find the event log for transaction when the CAP was created
// ... but the parameters for the constructor are slightly different
// String encoding, watch out for \n and \u2019 special characters.
// You can run this in the web console at http://remix.ethereum.org/

web3.eth.abi.encodeParameters(['address','address[]','uint[]','string[]','bytes[]','string','address','address'],[
'0x9b68c14e936104e9a7a24c712beecdc220002984',
['0x3d9819210a31b4961b30ef54be2aed79b9c9cd3b'],
[0],
['_setCollateralFactor(address,uint256)'],
['0x000000000000000000000000C11B1268C1A384E55C48C2391D8D480264A3A7F40000000000000000000000000000000000000000000000000A688906BD8B0000'],
'# Set WBTC Collateral Factor to 75%\nThis change increases the Collateral Factor of WBTC from 60% to 75%. \n\nOn October 1st, Proposal 24 was passed to raise WBTC\u2019s Collateral Factor from 40% to 60%. According to Defi Pulse, on October 1st, there were ~$1B of WBTC in circulation. Today there are $4.38B of WBTC in circulation. In addition to having a much larger supply today, WBTC liquidity has significantly grown since Proposal 24 was passed.\n\nUniswap: $150M\nSushiswap: $256M\nBalancer: $200M\n1inch: $160M\n\nIn addition to growing liquidity on decentralized exchanges, centralized exchanges are continuing to adopt WBTC. Shortly after Proposal 24 passed, Coinbase added WBTC markets. As well, Binance continues to be a growing hub for WBTC/BTC trading. \n\nWith the significant increase in WBTC circulation, liquidity, and infrastructure, it is safe for Compound to increase Collateral Factor to 75%. From a growth/business standpoint, AAVE currently has its Collateral Factor set to 75%. Compound Finance needs to remain competitive to avoid losing market share.',
'0xc00e94cb662c3520282e6f5717214004a7f26888',
'0xc0da01a04c3f3e0be433606045bb7017a7323e38'
])
