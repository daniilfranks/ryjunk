class A

  def initialize
    ObjectSpace.define_finalizer(self, self.class.method(:finalize))
  end

  def self.finalize(object_id)
    p "finalizing %d" % object_id
  end

 # def finalize(object_id)
 #   p "finalizing %d" % object_id
 # end
end

a = A.new
#a = nil

#GC.start