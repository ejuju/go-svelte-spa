<script lang="ts">
  import Router from 'svelte-spa-router'
  import { wrap } from 'svelte-spa-router/wrap'

  const routes = {
    '/':  wrap({asyncComponent: () => import('./pages/Home.svelte')}),
    '/author/:author_slug': wrap({asyncComponent: () => import('./pages/Author.svelte')}),
    '*':  wrap({asyncComponent: () => import('./pages/NotFound.svelte')}),
  }
</script>

<main>
  <Router {routes} />
</main>
