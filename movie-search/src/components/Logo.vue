<template>
    <router-link to="/" class="logo">
        <span>OMDbAPI</span>.COM
    </router-link>
</template>

<style lang="scss" scoped>
@import "../style/main.scss";

.logo {
    font-family: "Oswald", sans-serif;
    font-size: 20px;
    color: $black;
    text-decoration: none;
    &:hover {
        color: $black;
    }
    span {
        color: $primary;
    }
}
</style>