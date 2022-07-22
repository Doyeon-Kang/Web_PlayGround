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
            return this.$store.state.movie.movies // 영화 정보 객체 배열 데이터
        }
    }
}
</script>