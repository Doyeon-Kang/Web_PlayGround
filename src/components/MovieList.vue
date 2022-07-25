<template>
    <div class="container">
        <div class="inner">
            <div class="message">
                {{ message }}
            </div>
            <div class="movies">
                <MovieItem v-for="movie in movies" :key="movie.imdbID" :movie="movie" />
            </div>
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
        },
        message() {
            return this.$store.state.movie.message
        }
    }
}
</script>

<style lang="scss" scoped>
@import "../style/main.scss";

.container {
    margin-top: 30px;
    .inner {
        background-color: $gray-200;
        padding: 10px 0;
        border-radius: 4px;
    }
    .movies {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
}
</style>