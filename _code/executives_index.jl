function hfun_executives_index()

    data = joinpath("_data", "executives.json")
    data = JSON.parsefile(data, dicttype=Dict)

    template = joinpath("_templates", "name-card.html")
    template = Mustache.load(template)

    html = ""

    for entry ∈ data

        html = html * Mustache.render(template, entry)
    end

    return html
end