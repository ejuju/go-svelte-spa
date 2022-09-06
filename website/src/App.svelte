<script lang="ts">
  import Router from 'svelte-spa-router'
  import { wrap } from 'svelte-spa-router/wrap'

  const routes = {
    '/':  wrap({asyncComponent: () => import('./pages/Home.svelte')}),
    '/song/:author_slug/:song_slug?': wrap({asyncComponent: () => import('./pages/Song.svelte')}),
    '/author/:author_slug': wrap({asyncComponent: () => import('./pages/Author.svelte')}),
    '*':  wrap({asyncComponent: () => import('./pages/NotFound.svelte')}),
  }
</script>

<main>
  <Router {routes} />
</main>
