<template>
    <footer>
        <Logo></Logo>
        <a href="https://github.com/Doyeon-Kang" target="_blank">
            (c){{ new Date().getFullYear() }} Dobby
        </a>
    </footer>
</template>

<script>
import Logo from './Logo'

export default {
    components: {
    Logo,
    Logo
}
}
</script>

<style lang="scss" scoped>
footer {
    padding: 70px 0;
    text-align: center;
    opacity: .3;
    .logo {
        display: block;
        margin-bottom: 4px;
    }
}
</style>