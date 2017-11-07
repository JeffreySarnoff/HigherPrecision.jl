__precompile__()

module HigherPrecision

    export square, cube

    import Base: +, -, *, /, ^, <, ==, <=

    include("basics.jl")
    include("computemode.jl")
    include("double.jl")
    # include("quad.jl")

end # module
