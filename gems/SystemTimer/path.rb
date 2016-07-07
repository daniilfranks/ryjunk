
idx = Dir.pwd.split('/').index('gems')

p  Dir.pwd.split('/')[0..idx].join('/')



p Dir.pwd.split('/')[0..lambda { Dir.pwd.split('/').index('gems')}.()].join('/').concat('/mongoid.yml')


