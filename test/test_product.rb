require 'test_helper'
require 'product'

class ProductTest < MiniTest::Test
  def test_initialize
    product = Product.new('Empanada', 15)
    assert_equal product.name, 'Empanada'
  end

  def test_find_by_id
    product = Product.find(20)
    assert_equal product.name, 'Portatil'
  end

  def test_find_no_records
    err = assert_raises RuntimeError do
      Product.find(999)
    end
    assert_equal err.message, 'EmpanadaRecordError: Record Not Found!'
  end

  #kata
  def test_find_all
    product = Product.all.map {|p| p.id}
    assert_equal product.sort, [10, 20]
  end

  def test_count
    assert_equal  Product.count, 2
  end

  def test_first
    assert_equal Product.first.id, 20
  end

  def test_where
    product = Product.where("id = 10")
    assert_equal product.first.id, 10
  end

  def test_last
    assert_equal Product.last.id, 20
  end

  def test_find_by
    product = Product.find_by("name", "Portatil")
    assert_equal product.id, 20
  end
end
