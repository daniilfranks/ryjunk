require 'mustache'

n =Mustache.render("Hello {{planet}}", :planet => "World!")

p n
