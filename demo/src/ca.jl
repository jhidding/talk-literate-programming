using ArgParse

function neighbourhood(u)
    return circshift(u, 1) * 4 .+ u * 2 .+ circshift(u, -1) .+ 1
end
function rule(p)
    rule_map = convert(Array{Bool}, digits(p, base=2, pad=8))
    return (u) -> rule_map[neighbourhood(u)]
end
function evolve(rule, u)
    return Channel() do ch
        put!(ch, u)
        while true
            u = rule(u)
            put!(ch, u)
        end
    end
end
function print_matrix(x)
    println(join([join((string ∘ Int64).(y), " ")
                  for y in eachcol(x)], "\n"))
end

function parse_command_line()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "--size", "-s"
            help = "size of universe"
            default = "512"
        "--gen", "-g"
            help = "number of generations"
            default = "512"
        "--rule", "-r"
            help = "rule number"
            default = "30"
    end

    return parse_args(s)
end

function main()
    args = parse_command_line()
    N = parse(Int64, args["size"])
    T = parse(Int64, args["gen"])
    p = parse(Int64, args["rule"])

    universe = rand(Bool, N)
    history = Iterators.take(evolve(rule(p), universe), T)
    print_matrix(hcat(collect(history)...))
end

main()