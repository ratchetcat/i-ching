#!/usr/env/ruby -w

require 'test/unit'
require 'iching.rb'

class TestCaster < Test::Unit::TestCase

  def setup
    @c = IeChing::Caster.new
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
      assert_equal( IeChing::Hexagram, temp[0].class )
    end
  end

  def test_cast_returns_hexagram_with_six_lines
    100.times do | i |
      temp = @c.cast
      assert_equal( 6, temp[0].size )
    end
  end

end


class TestHexagram < Test::Unit::TestCase
  
  def setup
    @h = IeChing::Hexagram.new()
  end
  
  def setup_line( moving = true, type = IeChing::YIN )
    @h << { :moving => moving, :type => type }
  end
  
  def setup_lines
    setup_line( true )
    setup_line( false )
    setup_line( true )
    setup_line( false, IeChing::YANG )
    setup_line( false, IeChing::YANG )
    setup_line( false, IeChing::YANG )
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
  
  def test_top_signature_exception
    setup_line
    assert_raise( Exception ) { @h.top_signature }
  end

  def test_bottom_signature_exception
    setup_line
    assert_raise( Exception ) { @h.bottom_signature }
  end

  def test_signature_exception
    setup_line
    assert_raise( Exception ) { @h.signature }
  end
  
  def test_top_signature
    setup_lines
    assert_equal( [ 1, 1, 1 ], @h.top_signature )
  end

  def test_bottom_signature
    setup_lines
    assert_equal( [ 0, 0, 0 ], @h.bottom_signature )
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