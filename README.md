Mock Stub Demo
==============

This is a ruby on rails demo of how Mock objects and Stub tests work using RSpec.

Introduction
------------
Rspec-mocks is a test-double framework for rspec with support for method stubs, fakes,
and message expectations on generated test-doubles and real objects alike.

Mock
----

It is some object that represents a real object,for testing purposes.These are also known as test doubles. 
A mock doesn’t touch the database–and thus takes less time to set up in a test. Build_stubbed will never hit the database, 
although it will create the associations if the factory has some.

Stub
----

This overrides a method call on a given object and returns a predetermined value for it. In other words, a stub is a fake method which, 
when called upon, will return a real result for use in our tests. You’ll commonly use this to override the default functionality 
for a method, particularly in database or network-intensive activity. In other words, a method stub is an instruction to an object 
(real or test double) to return a known value in response to a message.

Factory Girl Methods
--------------------

```Ruby

# Creates an instance of the model but does not make it persistent on the database

FactoryGirl.build(:model)

# Creates a fully stubbed model but does not make it persistent on the database.
# It works similar to the build method but it does not persist the model. It stubs out a handful 
# of methods that interact with the database and raises if you call them. This means that in order
# to be able to use this method on a model, the model needs to inherit from Active Record.

FactoryGirl.build_stubbed(:model)

# Creates an instance of the model and it does make it persistent on the database

FactoryGirl.create(:model)

# Creates a hash representing the model with its methods. This method is usually used when 
# creating controller tests.

FactoryGirl.attributes_for(:model)

```

Deprecation Message
-------------------

The following deprecation message can be experienced when using mock and stub:

Using `stub` from rspec-mocks' old `:should` syntax without explicitly enabling 
the syntax is deprecated. Use the new `:expect` syntax or explicitly enable 
`:should` instead. 

The above message can be eliminated by adding the following configuration to the 
spec_helper file:

```Ruby

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

```

SQLite methods
--------------

The following command will give you access to the development database:

sqlite3 db/development.sqlite3

This allows you to better understand the way the different Factory Girl
methods work when using them.

Views are stubbed by default
----------------------------

This allows you to specify which view template an action should try to render 
regardless of whether the template compiles cleanly.

Did you know?
-------------

Double is an alias for mock. However, the use of mock is deprecated on newer 
versions of the rspec gem.

When a method or property is stubbed it will not get executed.

By default, controller specs stub views with a template that renders an empty
string instead of the views in the app. 

You can include the mock config of the gem as follows: 

```Ruby

require "rspec/mocks/standalone" 

```

More tools
-----------

```Ruby

# Runs the block one time before all of the examples are run.

before(:all){ variable = initialization }

# Runs the block one time before each of your specs in the file. 
# This can be used along with stubbing since it needs to stub the set of methods before each test.

before(:each){ variable = initialization }

# It is lazy loaded which means that it will modify-use the variable until is called and not before.

let(:model) { FactoryGirl.create(:model) }

# It is not lazy loaded which means that it will modify-use the variable the moment is declared.

let!(:model) { FactoryGirl.create(:model) }

# It is a message expectation rather than a call to a stub. 
# However, the code will still not get executed but it will get validated.

Model.should_receive().with() 

```

Why would someone use Mocks and Stubs on a project?
---------------------------------------------------

- To start developing the behavior of models, controllers, etc of a project. 

This allows the developer to start developing the tests using models or any other required elements
without having even created them. Then, later at the development process they can be replaced by the real
models and elements.

- To speed up the tests running process.

Sometimes the testing process requires heavy interaction with the database which can lead to a considerable
amount of time consumed. By mocking and stubbing some elements then the tests will require less time to be 
run since the interaction with the database would be faked. 

- To test a method or functionality.

Sometimes an application needs to get information from a webservice or the cloud. Given the fact that
in order to be able to test such connection would required a lot of resources consumed and probably
authentication information that cannot be accessed by the user or the developer then stubbing such
functionality is the perfect scenario. This will allow the developer to test a whole set of methods,
properties and other elements from his project by simulating the data or information extracted from the
stubbed web service or cloud.
  
References
----------
* https://github.com/thoughtbot/factory_girl/wiki/Usage
* http://robots.thoughtbot.com/factory-girl-2-5-gets-custom-constructors
* http://robots.thoughtbot.com/use-factory-girls-build-stubbed-for-a-faster-test
* http://blog.spoolz.com/2012/07/09/small-revelation-factorygirl-build_stubbed-associations-and-let/
* https://www.relishapp.com/rspec/rspec-core/v/2-6/docs/helper-methods/let-and-let
* http://blog.12spokes.com/web-design-development/how-factorygirl-can-slow-down-your-test-suite-aka-factory-build-vs-blank-activerecord-objects/
* https://www.relishapp.com/rspec/rspec-mocks/v/2-11/docs/outside-rspec/standalone