Mock Stub Demo
==============

This is a ruby on rails demo of how Mock objects and Stub tests work using RSpec.

Important Notes
===============

before(:all) runs the block one time before all of the examples are run.

before(:each) runs the block one time before each of your specs in the file.

let is lazy loaded which means that it will modify-use the variable when called.

let is not lazy loaded which means that it will modify-use the variable when declared.

Factory Girl Methods
====================

Factory.build

Does not save your Listing, but it does save your associations

Factory.build_stubbed

It works similar to the build method but it does not persist the model. It stubs out a handful 
of methods that interact with the database and raises if you call them. For example:

SQLite methods
==============

The following command will give you access to the development database:

sqlite3 db/development.sqlite3

This allows you to better understand the way the different Factory Girl
methods work when using them.

References
----------

* https://github.com/thoughtbot/factory_girl/wiki/Usage
* http://robots.thoughtbot.com/factory-girl-2-5-gets-custom-constructors
* http://robots.thoughtbot.com/use-factory-girls-build-stubbed-for-a-faster-test
* http://blog.spoolz.com/2012/07/09/small-revelation-factorygirl-build_stubbed-associations-and-let/
* https://www.relishapp.com/rspec/rspec-core/v/2-6/docs/helper-methods/let-and-let
* http://blog.12spokes.com/web-design-development/how-factorygirl-can-slow-down-your-test-suite-aka-factory-build-vs-blank-activerecord-objects/