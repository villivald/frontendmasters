<script lang="ts">
	import Grid from "./Grid.svelte";
	import Found from "./Found.svelte";

    import { levels } from "./levels";
	import { shuffle } from "./utils";

    import type { Level } from "./levels";

    const level = levels[0];

    let size: number = level.size;
    let grid: string[] = create_grid(level);
    let found: string[] = [];

    function create_grid(level: Level) {
        const copy = level.emojis.slice();
        const pairs: string[] = [];

        for (let i = 0; i < level.size ** 2 / 2; i += 1) {
            const index = Math.floor(Math.random() * copy.length);
            const emoji = copy[index];

            copy.splice(index, 1);
            pairs.push(emoji);
        }

        pairs.push(...pairs);

        return shuffle(pairs);
    }
</script>

<div class="game">
    <div class="info"></div>

    <div class="grid-container">
        <Grid
            {grid}
            on:found={(e) => {
                found = [...found, e.detail.emoji];
            }}
            {found}
        />
    </div>

    <div class="info">
        <Found {found} />
    </div>
</div>

<style>
.game {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%;
    font-size: min(1vmin, 0.5rem);
}

.info {
    width: 80em;
    height: 10em;
    background-color: aqua;
}

.grid-container {
    width: 80em;
    height: 80em;
    background-color: peru;
}
</style>
