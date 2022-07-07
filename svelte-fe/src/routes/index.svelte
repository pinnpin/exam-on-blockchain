<script>
    import WalletConnect from '$lib/WalletConnect.svelte';
    import AddQuestion from '$lib/AddQuestion.svelte';
    import contractAbi from '../contracts/QuizFactory.json';
    // NEW
    import AllQuestions from '$lib/AllQuestions.svelte';
    const contractAddr = 'REDACTED GRAB YOUR OWN FROM ALCHEMY';
    export let web3Props = {
        provider: null,
        signer: null,
        account: null,
        chainId: null
    };
</script>

<h1>Exam</h1>
{#if !web3Props.account}
    <WalletConnect bind:web3Props {contractAddr} {contractAbi} />
{:else}
    Welcome 
    <AddQuestion {web3Props} />
    <!-- NEW -->
    <br />
    <br />
    <AllQuestions {web3Props} />
{/if}
