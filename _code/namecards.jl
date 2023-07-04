function hfun_namecardlist(jsonfile::Vector{String})

    data = joinpath("_data", jsonfile[1])
    data = JSON.parsefile(data, dicttype=Dict)

    template = joinpath("_templates", "name-card.html")
    template = Mustache.load(template)

    html = ""

    for entry ∈ data

        html = html * Mustache.render(template, entry)
    end

    return html
end