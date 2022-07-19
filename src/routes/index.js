import { createRouter, createWebHashHistory } from 'vue-router'
import Home from './Home'
import About from './About'
import Movie from './Movie'

export default createRouter({
    // Hash mode 사용 | History mode는 서버에 따로 세팅을 해야 함
    // https://google.com/#/search
    // 특정 페이지에서 새로고침을 했을 때 페이지를 찾을 수 없다는 메시지를 방지
    history: createWebHashHistory(),
    // pages
    routes: [
        {
            path: '/',
            component: Home
        },
        {
            path: '/about',
            component: About
        },
        {
            path: '/movie',
            component: Movie
        }
    ]
})