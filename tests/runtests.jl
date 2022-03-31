using Test
using Flatland

aa = randn(111)
xx = map(aa) do x x<0 ? nothing : x^2 end
@test flatmap(mkopt, xx) == [x^2 for x in aa if x >= 0]
@test flatmap(mkopt, xx) == filter(!isnothing, xx)
@test flatmap(1:3) do j flatmap(1:4) do k j<k ? ((j,k),) : () end end == [(j,k) for j in 1:3 for k in 1:4 if j<k]
yy = flatmapi(1:3) do j
    xx = Iterators.map(1:4) do k
        j<k ? (j,k) : nothing
    end
    flatmapi(mkopt, xx)
end
@test collect(yy) == [(j,k) for j in 1:3 for k in 1:4 if j<k]
