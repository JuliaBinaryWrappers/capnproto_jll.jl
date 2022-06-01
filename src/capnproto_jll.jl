# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule capnproto_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("capnproto")
JLLWrappers.@generate_main_file("capnproto", UUID("3576fdfd-e245-5854-bcf7-dae6dc3117e0"))
end  # module capnproto_jll
