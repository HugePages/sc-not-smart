// npm install ethereumjs-tx
// load requirements js lib
    const ethTx = require('ethereumjs-tx').Transaction;
// constructor txData
    const txData = {
        nonce: '0x00',// 交易的自增数字, 确保交易顺序执行
        gasPrice: '0x09184e72a000', //燃料费的价格
        gasLimit: '0x30000', //燃料费数量
        to: '0x0000000000000000000000000000000000000000', //目标地址
        value: '0x00',//资金数量
        data: '0x000', // 交易data,可以存储消息, 函数,方法等
        v: '0x1c',
        r: 0,
        s: 0
    };
    tx = new ethTx(txData);
    console.log('RLP-Encoded Tx: 0x' + tx.serialize().toString('hex')) ;
    txHash = tx.hash(); // This step encodes into RLP and calculates the hash
    console.log('Tx Hash: 0x' + txHash.toString('hex'))
    // Sign transaction
    const privKey = Buffer.from( '91c8360c4cb4b5fac45513a7213f31d4e4a7bfcb4630e9fbf074f42a203ac0b9', 'hex');
    tx.sign(privKey);
    serializedTx = tx.serialize();
    rawTx = 'Signed Raw Transaction: 0x' + serializedTx.toString('hex');
    console.log(rawTx)

