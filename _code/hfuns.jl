var = nothing;

"""
    hfun_vardef(name)
    
Makes the variable `name` available under the name `var`. To be used with
`hfun_varfree()` to introduce a scoped variable to be used when inserting 
html templates into a page. 
"""
function hfun_vardef(name)
    
    # Prevent misuse.
    if var != nothing 
        error("Missing {{varfree}}") 
    end 
    
    name_eval = eval(Meta.parse(name[1]))     
    
    if name_eval == nothing
        # name wasn't a variable.    
        global var = name[1]
    else
        # name was a variable.
        global var = name_eval
    end
    
    return ""
end

"""
    hfun_varfree()
    
Resets the variable `var` to `nothing`. Used to end the variable scope 
opened by `hfun_vardef(name)`.
"""
function hfun_varfree()

    global var = nothing
    return ""
end 

"""
    hfun_expfill(exp)
    
Similar to `{{fill var}}` except `var` becomes a Julia expression which
gets interpreted before it's inserted into the document. This allows you
to use more complicated data structures in HTML templates, such as structs.
"""
function hfun_expfill(exp)
    
    # Concatenating exp together, allows expressions with spaces in them.
    str = *(exp...)
    expr = Meta.parse(str)
    val  = eval(expr)
    return String(val)
end
