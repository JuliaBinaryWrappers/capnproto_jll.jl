# Autogenerated wrapper script for capnproto_jll for aarch64-linux-gnu
export capnp, libcapnp

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `capnp`
const capnp_splitpath = ["bin", "capnp"]

# This will be filled out by __init__() for all products, as it must be done at runtime
capnp_path = ""

# capnp-specific global declaration
function capnp(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(capnp_path)
    end
end


# Relative path to `libcapnp`
const libcapnp_splitpath = ["lib", "libcapnp.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcapnp_path = ""

# libcapnp-specific global declaration
# This will be filled out by __init__()
libcapnp_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcapnp = "libcapnp-0.7.0.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"capnproto")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global capnp_path = normpath(joinpath(artifact_dir, capnp_splitpath...))

    push!(PATH_list, dirname(capnp_path))
    global libcapnp_path = normpath(joinpath(artifact_dir, libcapnp_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcapnp_handle = dlopen(libcapnp_path)
    push!(LIBPATH_list, dirname(libcapnp_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

