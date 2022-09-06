<script>
import Counter from "../lib/Counter.svelte";
import { link } from "svelte-spa-router";
import active from 'svelte-spa-router/active'
</script>


  <h1>Go + Svelte SPA</h1>

  <a href="/song/hehe" use:link use:active={{path: '/hello/*', className: 'active', inactiveClassName: 'inactive'}}>Say hi!</a>

  <div>
    <Counter />
  </div>