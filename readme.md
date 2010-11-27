Capistrano + Babushka = **Capushka**
====================================

This tiny gem does one thing: allows you to run Babushka deps from your Capistrano recipes and pass in variables.

Portions are based on Dollhouse.

Install
-------

Gemfile:

    gem 'capushka'

Example
-------

in your config/deploy.rb

    require "capushka"
    
    ...
    # Usual deploy recipe stuff
    ...
    
    namespace :setup do
      task :create_application_user do
        # This is the magic part
        babushka 'benhoskings:user exists', {:username => application}
        
      end
    end
    
This will create a new user in your application name

This does of course assume you have babushka bootstrapped, if not, run the **bootstrap_babushka** task

TODO:
====

- Better error checking and handling
- Cleanup STDOUT from babushka which doesn't play real nice with Capistrano
- Don't run in parallel?

Contributing
============

Once you've made your great commits:

1. Fork This repository
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Send a pull request
5. That's it!

Authors
=======

Ivan Vanderbyl :: ivan at asterism dot com dot au :: [@IvanVanderbyl](http://twitter.com/ivanvanderbyl)

License
=======

Copyright (c) 2010 Ivan Vanderbyl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.