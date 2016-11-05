# HELPERS

## Basics

Helpers are methods that are defined in a central place but which can be used
inside of your view templates.

## Adding helpers

Add helpers here inside of *.rb files inside this directory e.g.:
`app/helpers/formatting.rb`.

Inside this file define your helpers like:

```
helpers do
  def em(text)
    "<em>#{text}</em>"
  end
end
```

## Reloading

After you create new files containing helpers, you must restart the web server
so that your changes are reloaded into the running web server process.  This is
because helper files are read *only once* at web-server *startup* time.  Also,
if you add a new helper or alter its implementation, you *also* must restart it
so that "sourced" (i.e. read in) anew.  Other web frameworks do not require
this restart e.g. Rails but in this starter kit  you're best not "bubbling out"
helpers until your implementation has "gelled."
