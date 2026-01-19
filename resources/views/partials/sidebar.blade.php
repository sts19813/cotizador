<div id="kt_app_sidebar" class="app-sidebar flex-column" data-kt-drawer="true" data-kt-drawer-name="app-sidebar"
    data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="250px"
    data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_app_sidebar_mobile_toggle">

    <!--begin::Wrapper-->
    <div id="kt_app_sidebar_wrapper" class="app-sidebar-wrapper">
        <div class="hover-scroll-y my-5 my-lg-2 mx-4" data-kt-scroll="true"
            data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-height="auto"
            data-kt-scroll-dependencies="#kt_app_header" data-kt-scroll-wrappers="#kt_app_sidebar_wrapper"
            data-kt-scroll-offset="5px">

            <!--begin::Sidebar menu-->
            <div id="kt_app_sidebar_menu" data-kt-menu="true" data-kt-menu-expand="false"
                class="app-sidebar-menu-primary menu menu-column menu-rounded menu-sub-indention menu-state-bullet-primary px-3 mb-5">

                <!-- Dashboard -->
                <div class="menu-item">
                    <a class="menu-link {{ request()->is('admin/dashboard') ? 'active' : '' }}"
                        href="{{ route('admin.dashboard') }}">
                        <span class="menu-icon">
                            <i class="ki-outline ki-element-11 fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.dashboard') }}</span>
                    </a>
                </div>

                <!-- Productos -->
                <div class="menu-item">
                    <a class="menu-link {{ request()->is('admin/products*') ? 'active' : '' }}"
                        href="{{ route('admin.products.index') }}">
                        <span class="menu-icon">
                            <i class="ki-outline ki ki-package fs-2 fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.products') }}</span>
                    </a>
                </div>

                <!-- Leads -->
                <div class="menu-item">
                    <a class="menu-link {{ request()->is('admin/leads*') ? 'active' : '' }}"
                        href="{{ route('admin.leads.index') }}">
                        <span class="menu-icon">
                            <i class="ki-outline ki-user fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.leads') }}</span>
                    </a>
                </div>

                <!-- Casas Creadas -->
                <div class="menu-item">
                    <a class="menu-link {{ request()->is('admin/casas-creadas') ? 'active' : '' }}"
                        href="{{ route('admin.houses.index') }}">
                        <span class="menu-icon">
                            <i class="ki-outline ki-home-2 fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.houses_created') }}</span>
                    </a>
                </div>

                <!-- Casas Creadas -->
                <div class="menu-item">
                    <a class="menu-link {{ request()->is('admin/solicitudes') ? 'active' : '' }}"
                        href="{{ route('admin.houses.requests') }}">
                        <span class="menu-icon">
                            <i class="ki-outline ki-user fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.requests') }}</span>
                    </a>
                </div>

                <!-- Precios base -->
                <div class="menu-item">
                    <a class="menu-link {{ request()->is('admin/precio/fachadas*') ? 'active' : '' }}"
                        href="/admin/precio/fachadas">
                        <span class="menu-icon">
                            <i class="ki-outline ki-dollar fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.base_prices') }}</span>
                    </a>
                </div>

                <!-- Renderizados -->
                <div class="menu-item menu-accordion {{ request()->is('admin/renders*') ? 'show' : '' }}"
                    data-kt-menu-trigger="click">
                    <span class="menu-link">
                        <span class="menu-icon">
                            <i class="ki-outline bi-image fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.renders') }}</span>
                        <span class="menu-arrow"></span>
                    </span>

                    <div class="menu-sub menu-sub-accordion">
                        <div class="menu-item">
                            <a class="menu-link" href="{{ url('/admin/renders/Minimalista') }}">
                                <span class="menu-bullet"><span class="bullet bullet-dot"></span></span>
                                <span class="menu-title">Minimalista</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a class="menu-link" href="{{ url('/admin/renders/Tulum') }}">
                                <span class="menu-bullet"><span class="bullet bullet-dot"></span></span>
                                <span class="menu-title">Tulum</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a class="menu-link" href="{{ url('/admin/renders/Mexicano') }}">
                                <span class="menu-bullet"><span class="bullet bullet-dot"></span></span>
                                <span class="menu-title">Mexicano</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Precios por Estilo -->
                <div class="menu-item menu-accordion {{ request()->is('admin/products/prices*') ? 'show' : '' }}"
                    data-kt-menu-trigger="click">
                    <span class="menu-link">
                        <span class="menu-icon">
                            <i class="ki-outline ki-price-tag fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.style_prices') }}</span>
                        <span class="menu-arrow"></span>
                    </span>

                    <div class="menu-sub menu-sub-accordion">
                        <div class="menu-item">
                            <a class="menu-link" href="{{ url('/admin/products/prices/Minimalista') }}">
                                <span class="menu-bullet"><span class="bullet bullet-dot"></span></span>
                                <span class="menu-title">Minimalista</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a class="menu-link" href="{{ url('/admin/products/prices/Tulum') }}">
                                <span class="menu-bullet"><span class="bullet bullet-dot"></span></span>
                                <span class="menu-title">Tulum</span>
                            </a>
                        </div>
                        <div class="menu-item">
                            <a class="menu-link" href="{{ url('/admin/products/prices/Mexicano') }}">
                                <span class="menu-bullet"><span class="bullet bullet-dot"></span></span>
                                <span class="menu-title">Mexicano</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Categorías -->
                <div class="menu-item">
                    <a class="menu-link {{ request()->is('admin/categories*') ? 'active' : '' }}"
                        href="{{ route('admin.categories.index') }}">
                        <span class="menu-icon">
                            <i class="ki-outline ki-tag fs-2"></i>
                        </span>
                        <span class="menu-title">{{ __('sidebar.categories') }}</span>
                    </a>
                </div>
            </div>
            <!--end::Sidebar menu-->
        </div>
    </div>
    <!--end::Wrapper-->
</div>