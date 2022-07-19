<template>
    <header>
        <div class="nav nav-pills">
            <div class="nav-item" v-for="nav in navigations" :key="nav.name">
                <router-link active-class="active" :to="nav.href" class="nav-link">
                    {{ nav.name }}
                </router-link>
            </div>
        </div>
    </header>
</template>

<script>
    export default {
        data() {
            return {
                navigations: [
                    {
                        name: 'Search',
                        href: '/'
                    },
                    {
                        name: 'Movie',
                        href: '/movie'
                    },
                    {
                        name: 'About',
                        href: '/about'
                    },
                ]
            }
        }
    }
</script>