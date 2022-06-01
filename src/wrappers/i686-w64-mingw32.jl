# Autogenerated wrapper script for capnproto_jll for i686-w64-mingw32
export capnp, libcapnp

JLLWrappers.@generate_wrapper_header("capnproto")
JLLWrappers.@declare_library_product(libcapnp, "libcapnp-0-8-0.dll")
JLLWrappers.@declare_executable_product(capnp)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libcapnp,
        "bin\\libcapnp-0-8-0.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        capnp,
        "bin\\capnp.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
