<aside id="sidebar-wrapper">
    <div class="sidebar-brand">
        <a href="index.html">Stisla</a>
    </div>
    <div class="sidebar-brand sidebar-brand-sm">
        <a href="index.html">St</a>
    </div>
    <ul class="sidebar-menu">

        <li class="menu-header">Starter</li>
        <li>
            <a class="nav-link" href="/home"><i class="far fa-square"></i> <span>Blank
                    Page</span></a>
        </li>
        <li class="nav-item dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i>
                <span>User Management</span></a>
            <ul class="dropdown-menu">
                <li><a class="nav-link " href="{{ route('user.index') }}">Users List</a></li>
                <li><a class="nav-link " href="#">Roles</a></li>
            </ul>
        </li>
    </ul>

</aside>
