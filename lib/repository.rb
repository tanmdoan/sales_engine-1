require 'csv'

class Repository

  attr_accessor :objects

  def initialize(objects =[])
    @objects = objects
  end

  def all() @objects end

  def random() @objects.sample end

  def method_missing(meth, *args)
    case meth.to_s
    when /^find_by_(.+)$/
      @objects.detect do |object|
        object.send($1) == args.first
      end
    when /^find_all_by_(.+)$/
      @objects.select do |object|
        object.send($1) == args.first
      end
    else
      super
    end
  end

  def respond_to?(meth)
    case meth.to_s
    when /^find_by_.*$/ || /^find_all_by_.*$/
      true
    else
      super
    end
  end

  def inspect
    "#<#{self.class} #{@merchant.size} rows>"
  end

end
