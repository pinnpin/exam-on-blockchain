<script>
    import { ethers } from 'ethers';
    export let web3Props = {
        provider: null,
        signer: null,
        account: null,
        chainId: null,
        // new prop
        contract: null
    };
    // new variable for the contract address
    export let contractAddr = '';
    // new variable for the contract ABI
    export let contractAbi = { abi: null };

    async function connectWallet() {
        let provider = new ethers.providers.Web3Provider(window.ethereum, 'any');
        await provider.send('eth_requestAccounts', []);
        const signer = provider.getSigner();
        const account = await signer.getAddress();
        const chainId = await signer.getChainId();
        // new contract variable
        const contract = new ethers.Contract(contractAddr, contractAbi.abi, signer);
        // new value for contract
        web3Props = { signer, provider, chainId, account, contract };
    }
</script>

<button on:click={connectWallet}>Attach Wallet</button>