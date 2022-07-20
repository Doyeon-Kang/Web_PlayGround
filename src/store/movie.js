export default {
    // module
    namespaced: true,
    // data
    state: () => {
        return {
            movies: []
        }
    },
    // computed
    getters: {
        movieIds(state) {
            return state.movies.map(m => m.imdbID)
        }
    },
    // methods
    // 변이 - 데이터 변경가능 
    mutations: {
        resetMovies(state) {
            state.movies = []
        }
    },
    // 변이불가 - 데이터 변경하지 않는 메소드
    // 비동기 처리
    actions: {
        searchMovies({ state, commit}) {
            
        }
    }
}