(() => {
    try {
        let text = "Hello, I am Saurabh"
        let bytes32 = ethers.utils.formatBytes32String(text)
        console.log('The string ' + text + ' is converted into bytes32 as:')
        console.log(bytes32)
    } catch (e) {
        console.log(e.message)
    }
})()