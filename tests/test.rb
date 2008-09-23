#!/usr/env/ruby -w

require 'test/unit'
require 'iching'

class TestCaster < Test::Unit::TestCase

  def setup
    @c = IChing::Cast.new
  end
  
  def test_divide
    100.times do | i |
      temp = @c.divide( 49 )
      assert [ 2, 3 ].include?( temp[1] )
    end
  end
  
  def test_remainder
    (41 .. 44).each do | i |
      difference = i - 40
      assert_equal( difference, @c.remainder( i ) )
    end
  end

  def test_cast_line
    100.times do | i |
      temp = @c.cast_line
      assert [ 9, 7, 6, 8 ].include?( temp )
    end
  end
  
  def test_cast_returns_hexagram
    100.times do | i |
      temp = @c.cast
      assert_equal( IChing::Hexagram, temp[0].class )
    end
  end

  def test_cast_returns_hexagram_with_six_lines
    100.times do | i |
      temp = @c.cast
      assert_equal( 6, temp[0].size )
    end
  end

end


class TestTrigram < Test::Unit::TestCase
  
  def setup
    @t = IChing::Trigram.new()
  end
  
  def setup_line( moving = true, type = IChing::YIN )
    @t << { :moving => moving, :type => type }
  end

  def setup_lines
    setup_line( true )
    setup_line( false, IChing::YANG )
    setup_line( false )
  end
  
  def test_signature
    setup_lines
    assert_equal( [1, 0, 1], @t.signature )
  end
  
  def test_change_signature
    setup_lines
    temp = @t.change
    assert_equal( [0, 0, 1], temp.signature )
  end
  
  def test_to_s
    setup_lines
    temp = "---x---\n-------\n--- ---"
    assert_equal( temp, @t.to_s )
  end
  
end


class TestHexagram < Test::Unit::TestCase
  
  def setup
    @h = IChing::Hexagram.new()
  end
  
  def setup_line( moving = true, type = IChing::YIN )
    @h << { :moving => moving, :type => type }
  end
  
  def setup_lines
    setup_line( true )
    setup_line( false )
    setup_line( true )
    setup_line( false, IChing::YANG )
    setup_line( false, IChing::YANG )
    setup_line( false, IChing::YANG )
  end

  def test_moving_lines
    setup_lines
    assert_equal( [6, 4], @h.moving_lines )
  end
  
  def test_moving?
    setup_lines
    assert_equal( true, @h.moving? )
  end

  def test_changed_moving?
    setup_lines
    temp = @h.change
    assert_equal( false, temp.moving? )
  end
  
  def test_original_versus_changed
    setup_lines
    assert_not_equal( @h, @h.change )
  end
  
  def test_changed_moving_lines
    setup_lines
    temp = @h.change
    assert_equal( [], temp.moving_lines )
  end

  def test_signature_exception
    setup_line
    assert_raise( Exception ) { @h.signature }
  end

  def test_signature
    setup_lines
    assert_equal( [ 1, 1, 1, 0, 0, 0 ], @h.signature )
  end

  def test_change_signature
    setup_lines
    temp = @h.change
    assert_equal( [0, 1, 0, 0, 0, 0], temp.signature )
  end

  def test_to_s
    setup_lines
    temp = "---x---\n--- ---\n---x---\n-------\n-------\n-------"
    assert_equal( temp, @h.to_s )
  end

end