"""
    {{ link_css }}

Link the css from the files specified in the `css` pagevar. The path `css/` is
automatically prepended, you need write the file name (including .css extension).
"""
function hfun_link_css()

    css = locvar("css")
    return """<link rel="stylesheet" href="/css/$css">"""
end