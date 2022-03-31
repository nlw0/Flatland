module Flatland
export flatmapi, flatmap, mkopt
# Tuptional{X} = Union{Tuple{X}, Tuple{}}
flatmapi(x...) = Iterators.map(x...) |> Iterators.flatten
flatmap(x...) = flatmapi(x...) |> collect
function mkopt(x::Union{Nothing, X}) where {X}
    isnothing(x) ? () : (x,)
end
end
