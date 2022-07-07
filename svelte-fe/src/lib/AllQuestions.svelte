<script>
    // import your question component
    import Question from './Question.svelte';
    // variables for the contract
    export let web3Props = {
        provider: null,
        signer: null,
        account: null,
        chainId: null,
        contract: null
    };
    $: questions = null;
    // get ALL of the questions
    async function getQuestions() {
        questions = await web3Props.contract.getQuizzes();
        // listen for new questions
        web3Props.contract.on('QuizCreated', (addr) => {
            console.log('QuizCreated', addr);
            getQuestions();
        });
    }
    getQuestions();
</script>

<!-- If there are questions -->
{#if questions}
    <div class="question-wrapper">
        <!-- Loop through the questions -->
        {#each questions as questionAddr}
            <!-- Render the question component -->
            <Question {questionAddr} {web3Props} />
        {/each}
    </div>
{/if}

<style>
    .question-wrapper {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
</style>