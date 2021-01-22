import os
import web3
import json

# TEST SETUP to check unclaimed comp:
# (1) Put your Compound account address in ...
# ... environment variable 'MYACCOUNT' (ethereum wallet address)
# (2) Download the compound network files 'mainnet-abi.json' & 'mainnet.json'
# ... https://github.com/compound-finance/compound-config/tree/master/networks
# (3) Put files 'mainnet-abi.json' and 'mainnet.json' in ...
# ... script working directory

def test():
    myAddr = os.environ['MYACCOUNT']
    check_unclaimed_comp(myAddr)

mainnet = None
mainnet_abi = None

with open('mainnet.json') as contract_info:
    mainnet = json.load(contract_info)
with open('mainnet-abi.json') as abi_info:
    mainnet_abi = json.load(abi_info);
        
def check_unclaimed_comp(userAddr):
    w3 = web3.Web3(web3.Web3.HTTPProvider("https://cloudflare-eth.com/"))
    if w3.isConnected():
        lens = w3.eth.contract(
                abi = mainnet_abi['CompoundLens'],
                address = mainnet['Contracts']['CompoundLens']
            )
        compBal = lens.functions.getCompBalanceMetadataExt(
                comp = mainnet['Contracts']['Comp'],
                comptroller = mainnet['Contracts']['Comptroller'],
                account = userAddr
            ).call()
        walletComp = compBal[0]*1e-18
        unclaimedComp = compBal[-1]*1e-18
        print('Wallet COMP Balance: {}'.format(walletComp))
        print('Unclaimed COMP: {}'.format(unclaimedComp))
    # Sample output:
    #   Wallet COMP Balance: 0.123
    #   Unclaimed COMP: 0.456

test()
