require 'ruby-progressbar'

$progressbar = ProgressBar.create



50.times { 
$progressbar.increment 
print '.'
}

puts 'The end'

