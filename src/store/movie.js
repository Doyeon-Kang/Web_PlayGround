import axios from 'axios'

export default {
    // module
    namespaced: true,
    // data
    state: () => {
        return {
            movies: [],
            message: '',
            loading: false
        }
    },
    // computed
    getters: {},
    // methods
    // 변이 - 데이터 변경가능 
    mutations: {
        updateState(state, payload) {
            Object.keys(payload).forEach(key => {
                state[key] = payload[key]
            })
        },
        resetMovies(state) {
            state.movies = []
        }
    },
    // 변이불가 - 데이터 변경하지 않는 메소드
    // 비동기 처리
    actions: {
        async searchMovies({ commit }, payload) {
            const { title, type, number, year } = payload
            const OMDB_API_KEY = '7035c60c'

            const res = await axios.get(`https://www.omdbapi.com/?apikey=${OMDB_API_KEY}&s=${title}&type=${type}&y=${year}&page=1`)
            const { Search, totalResults } = res.data
            commit('updateState', {
                movies: Search
            })
        }
    }
}