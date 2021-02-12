(async () => {
    try {
    const contractAddress = '0xDf9D0C45d97f134151a386E0AA23b09CA903c13f'
    console.log('Getting owner...')
    const metadata = JSON.parse(await remix.call('fileManager', 'getFile', 'browser/contracts/artifacts/Owner.json'))
    const accounts = await web3.eth.getAccounts()
    let contract = new web3.eth.Contract(metadata.abi, contractAddress)
    contract.methods.getOwner().call({ from: accounts[0] }).then(console.log);
    } catch (e) {
        console.log(e.message)
    }
})()