function hfun_showblogposts() 
    
    files = readdir("blog")
    filter!(f -> endswith(f, ".md"), files) 
    filter!(f -> f != "index.md", files)
    files = joinpath.("blog", files)    
    
    html = """
        <div class=\"page-list\"> 
        <link rel=\"stylesheet\" href=\"css/blog-index.css\">
    """
    
    for post in files
        
        post_title = pagevar(post, :title)
        author    = pagevar(post, :author) 
        abstract = pagevar(post, :abstract) 
        
        
        
        html = html * """
        
        <div class=\"blog-card\"> 
            <a href=\"$post\">
                <div class=\"title\">$post_title</div> 
            </a>
            <div class=\"author\">$author</div> 
            <div class=\"abstract\">$abstract</div> 
        </div> 
        """
    end 
        
    html = html * """
   
        </div> 
    """
       
    return html
end
