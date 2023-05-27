<template>
    <div id="web-header">
        <b-navbar toggleable="md" type="light">

            <b-navbar-toggle target="web-header-nav-collapse"></b-navbar-toggle>

            <b-navbar-brand class="web-header-logo" to="/">
                logo
            </b-navbar-brand>

            <b-collapse is-nav id="web-header-nav-collapse">
                <b-navbar-nav>

                    <b-nav-item href="#">
                        <span>1</span>
                    </b-nav-item>

                    <b-nav-item href="#">
                        <span>2</span>
                    </b-nav-item>

                </b-navbar-nav>

                <!-- Right aligned nav items -->
                <b-navbar-nav class="ml-auto">

                </b-navbar-nav>
            </b-collapse>

        </b-navbar>
    </div>
</template>
