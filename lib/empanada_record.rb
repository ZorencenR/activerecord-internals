require 'sqlite_adapter'

module EmpanadaRecord
  class Base
    @@adapter = SqliteAdapter.new

    def self.find(id)
      results = @@adapter.run("SELECT * FROM #{table_name} WHERE id=#{id.to_i}")
      if results.any?
        self.new(*results.first)
      else
        raise 'EmpanadaRecordError: Record Not Found!'
      end
    end

    def self.table_name
      self.name + "s"
    end

    #kata
    def self.all
      results = @@adapter.run("SELECT * FROM #{table_name}")
      if results.any?
        results.map {|result| self.new(*result)}
      else
        raise 'EmpanadaRecordError: Records Not Found!'
      end
    end

    def self.count
      results = @@adapter.run("SELECT COUNT(*) FROM #{table_name}")
      if results.any?
        results.flatten.first
      else
        raise 0
      end    end

    def self.first
      results = @@adapter.run("SELECT * FROM #{table_name} limit 1")
      if results.any?
        self.new(*results.first)
      else
        raise 'EmpanadaRecordError: Record Not Found!'
      end
    end

    def self.where(query)
      results = @@adapter.run("SELECT * FROM #{table_name} WHERE #{query}")
      if results.any?
        results.map {|result| self.new(*result)}
      else
        nil
      end
    end

    def self.last
      results = @@adapter.run("SELECT * FROM #{table_name} ORDER BY rowid ASC limit 1")
      if results.any?
        self.new(*results.first)
      else
        raise 'EmpanadaRecordError: Record Not Found!'
      end
    end

    def self.find_by(attribute, data )
      #Object.const_get("Product")
      if respond_to?(attribute.to_s)
        results = @@adapter.run("SELECT * FROM #{table_name} WHERE #{attribute} = '#{data}'")
        if results.any?
          self.new(*results.first)
        else
          raise 'EmpanadaRecordError: Record Not Found!'
        end
      else
        raise "EmpanadaRecordError: undefined method '#{attribute}'"
      end
    end

    def self.attributes
      attrs = @@adapter.run("pragma table_info(#{table_name})")
      attrs.map {|attr| attr[1]}
    end

    def self.respond_to?(attribute)
      attributes.include? attribute
    end

  end
end


# Implement all, count, first, last, where, etc
# Implement find_by_attribute (dynamic attributes)
# Add support for multiple DB adapters (see Adapter pattern)
# Improve DB setup/teardown in tests