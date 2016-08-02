require 'json'
require 'awesome_print'
require 'ostruct'

CHORDBOT_FILE = './chordbot-backup.json'
# Read json file that turns it to ruby objects

fh = File.read(CHORDBOT_FILE) 

#data = JSON.load(fh, proc=ostruct)
data = JSON.parse(fh, object_class: OpenStruct)
#data = JSON.load(fh)
#ap data
#ap data.fileType
ap data.songs.first.songName

data.songs.each do | song | puts song.songName end
