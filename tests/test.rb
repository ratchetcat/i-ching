# Code Generated by ZenTest v. 3.10.0
#                 classname: asrt / meth =  ratio%
#          IChing::Hexagram:    0 /   10 =   0.00%
#           IChing::Trigram:    0 /    4 =   0.00%
#              IChing::Cast:    0 /    5 =   0.00%

require 'test/unit' unless defined? $ZENTEST and $ZENTEST
require 'iching'

module TestIChing
  class TestCast < Test::Unit::TestCase
    def setup
      @c = IChing::Cast.new
    end
    
    def test_cast
      temp = @c.cast
      assert_equal( IChing::Hexagram, temp[0].class )
    end

    def test_cast_line
      temp = @c.cast_line
      assert [ 9, 7, 6, 8 ].include?( temp )
    end

    def test_divide
      temp = @c.divide( 49 )
      assert [ 2, 3 ].include?( temp[1] )
    end

    def test_hexagrams
      assert @c.respond_to? :hexagrams
    end

    def test_remainder
      (41 .. 44).each do | i |
        difference = i - 40
        assert_equal( difference, @c.remainder( i ) )
      end
    end
  end
end


module TestIChing
  class TestHexagram < Test::Unit::TestCase
    def setup
      @h = IChing::Hexagram.new()
      setup_lines()
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
    
    def test_bottom_trigram
      assert_equal( [0, 0, 0], @h.bottom_trigram.signature )
    end

    def test_change
      temp = @h.change
      assert_equal( false, temp.moving? )
    end

    def test_description
      assert @h.respond_to? :description
    end

    def test_moving_eh
      assert_equal( true, @h.moving? )
    end

    def test_moving_lines
      assert_equal( [6, 4], @h.moving_lines )
    end

    def test_moving_lines_equals
      @h.moving_lines = [ 1, 2 ]
      assert_equal( [6, 5, 4], @h.moving_lines )
    end

    def test_signature
      assert_equal( [1, 1, 1, 0, 0, 0], @h.signature )
    end

    def test_top_trigram
      assert_equal( [1, 1, 1], @h.top_trigram.signature )
    end
  end
end


module TestIChing
  class TestTrigram < Test::Unit::TestCase
    def setup
      @t = IChing::Trigram.new()
      setup_lines()
    end
    
    def setup_line( moving = true, type = IChing::YIN )
      @t << { :moving => moving, :type => type }
    end

    def setup_lines
      setup_line( true )
      setup_line( false, IChing::YANG )
      setup_line( false )
    end
    
    def test_change
      temp = @t.change
      assert_equal( false, temp.moving? )
    end

    def test_moving_lines
      assert_equal( [3], @t.moving_lines )
    end

    def test_signature
      assert_equal( [1, 0, 1], @t.signature )
    end
  end
end