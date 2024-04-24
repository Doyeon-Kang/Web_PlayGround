import { createApp } from 'vue'
import App from './App.vue'
import router from './routes'
import store from './store'

// router, store 등은 미들웨어
// App으로 컴포넌트를 만든 후에 mount(화면에 부착) 이전에 지정해 놓은 router, store를 거치고 mount()를 실행한다. 
createApp(App).use(router).use(store).mount('#app')
