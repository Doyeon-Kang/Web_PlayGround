import axios from 'axios'
import _uniqBy from 'lodash/uniqBy'

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
            Object.keys(payload).forEach(key => {  // 객체로 담겨 온 영화 정보의 key 정보
                state[key] = payload[key]  // 해당 key 값을 갱신
            })
        },
        resetMovies(state) {
            state.movies = []
        }
    },
    // 변이불가 - 데이터 변경하지 않는 메소드
    // 비동기 처리
    actions: {
        async searchMovies({ state, commit }, payload) {
            try {
                const res = await _fetchMovie({...payload, page:1})
                const { Search, totalResults } = res.data
                commit('updateState', {
                    movies: _uniqBy(Search, 'imdbID') // 고유화 작업
                })

                const total = parseInt(totalResults, 10)  // totalResults typeof string
                const pageLength = Math.ceil(total / 10)  // 올림 함수

                // 추가 요청!
                if (pageLength  > 1) {
                    for (let page = 2; page <= pageLength; page += 1) {
                        if (page > payload.number / 10) {
                            break
                        }
                        const res = await _fetchMovie({...payload, page})
                        const { Search } = res.data
                        commit('updateState', {
                            movies: [...state.movies, ..._uniqBy(Search, 'imdbID')]
                        })
                    }
                }
            } catch (message) {
                commit('updateState', {
                    movies: [],
                    message
                })
            }
        }
    }
}

function _fetchMovie(payload) {
    const { title, type, year, page } = payload
    const OMDB_API_KEY = '7035c60c'
    const url = `https://www.omdbapi.com/?apikey=${OMDB_API_KEY}&s=${title}&type=${type}&y=${year}&page=${page}`

    return new Promise((resolve, reject) => {
        axios.get(url)
            .then((res) => {
                console.log(res)
                if (res.data.Error) {
                    reject(res.data.Error)
                }
                resolve(res)
            })
            .catch((err) => {
                reject(err.message)
            })
    })
}
