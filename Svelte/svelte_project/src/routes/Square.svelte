<script lang="ts">
    export let emoji: string;
    export let selected: boolean;
    export let found: boolean;
</script>

<div class="square" class:flipped={selected}>
    <button on:click />

    {#if !found}
        <span>
            {emoji}
        </span>
    {/if}
</div>

<style>
    .square {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: yellow;
    }

    .flipped button {
        background-color: red;
    }

    span {
        font-size: 5rem;
        pointer-events: none;
    }

    button {
        position: absolute;
        width: 100%;
        height: 100%;
    }
</style>