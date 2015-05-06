require 'empanada_record'

class Product < EmpanadaRecord::Base
  attr_accessor :id, :name

  def initialize(name =0, id = 0)
    @name = name
    @id = id
  end
end
