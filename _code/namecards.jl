"""
## Keys

### General
- name
- description
- headshot

### Socials

- mastodon
- github
- email
- twitter
"""
function hfun_namecardlist(jsonfile::Vector{String})

    template = joinpath("_templates", "name-card.html")
    template = read(template, String)
    template = Mustache.parse(template, ("[[", "]]"))

    data = joinpath("_data", jsonfile[1])
    data = JSON.parsefile(data, dicttype=Dict)

    html = ""

    for entry ∈ data 
        
        html = html * Mustache.render(template, entry)
    end

    return html
end