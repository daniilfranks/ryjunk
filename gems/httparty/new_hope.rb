require 'httparty'
require 'awesome_print'

class Foo
  class << self
    def new(uri, *args)
      Class.new(AbstractFoo) { |klass|
        klass.base_uri(uri)
      }.new(*args)
    end
  end

  class AbstractFoo
    include HTTParty

    def bar
      self.class.get '/some/resource'
    end

    def foo
      self.class.get '/'
    end
  end
end

foo1 = Foo.new('http://example.com')
foo2 = Foo.new('http://otvunget.st')

foo2 = Foo.new(testObject.get)  # This could be i1, t0 etc.... Read cucumber.yml or something else for base_url_paths?

ap foo1.foo
ap foo2.foo

