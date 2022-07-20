<template>
    <div class="container">
        <div class="inner">
            <MovieItem v-for="movie in movies" :key="movie.imdbID" :movie="movie" />
        </div>
    </div>
</template>

<script>
import MovieItem from './MovieItem.vue'

export default {
    components: {
        MovieItem
    },
    computed: {
        movies() {
            return this.$store.state.movie.movies
        }
    }
}
</script>