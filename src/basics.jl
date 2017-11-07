"""
    quick_two_sum(a, b)

Computes `s = fl(a+b)` and `e = err(a+b)`. Assumes `|a| ≥ |b|`.
"""
@inline function quick_two_sum(a::Float64, b::Float64)
    s = a + b
    e = b - (s - a)
    s, e
end

"""
    two_sum(a, b)

Computes `s = fl(a+b)` and `e = err(a+b)`.
"""
@inline function two_sum(a::Float64, b::Float64)
    s = a + b
    v = s - a
    e = (a - (s - v)) + (b - v)

    s, e
end

"""
    quick_two_diff(a, b)

Computes `s = fl(a-b)` and `e = err(a-b)`.  Assumes `|a| ≥ |b|`.
"""
@inline function quick_two_diff(a::Float64, b::Float64)
    s = a - b
    e = (a - s) - b
    s, e
end

"""
    two_diff(a, b)

Computes `s = fl(a-b)` and `e = err(a-b)`.
"""
@inline function two_diff(a::Float64, b::Float64)
    s = a - b
    v = s - a
    e = (a - (s - v)) - (b + v)

    s, e
end

"""
    two_prod(a, b)

Computes `s = fl(a*b)` and `e = err(a*b)`.
"""
@inline function two_prod(a::Float64, b::Float64)
    p = a * b
    e = fma(a, b, -p)
    p, e
end

"""
    two_square(a)

Computes `s = fl(a*a)` and `e = err(a*a)`. Faster than [`two_prod(a, a)`](@ref).
"""
@inline function two_square(a::Float64)
    p = a * a
    e = fma(a, a, -p)
    p, e
end

"""
    two_cube(a)

Computes `s = fl(a*a*a)` and `e = err(a*a*a)`. Faster than [`two_prod(a,two_prod(a, a))`].
"""
@inline function two_cube(a::Float64)
    p0 = a * a
    e0 = fma(a, a, -p0)
    p = a * p0
    e = fma(a, p0, -p)
    e = e + a*e0
    p, e
end
