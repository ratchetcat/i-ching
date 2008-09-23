module IChing
  
  YANG  = 0 #=> -------
  YIN   = 1 #=> --- ---
  

  class Hexagram < Array
    def initialize
      super
      @moving_lines = []
      @trigram_signatures = {
        [ 0, 0, 0 ] => { :name => "Ch'ien", :attribute => "Strong", :image => "Heaven", :relationship => "Father" },
        [ 1, 1, 1 ] => { :name => "K'un", :attribute => "Devoted, Yielding", :image => "Earth", :relationship => "Mother" },
        [ 1, 1, 0 ] => { :name => "Chen", :attribute => "Inciting, Movement", :image => "Thunder", :relationship => "First Son" },
        [ 1, 0, 1 ] => { :name => "K'an", :attribute => "Dangerous", :image => "Water", :relationship => "Second Son" },
        [ 0, 1, 1 ] => { :name => "Ken", :attribute => "Resting", :image => "Mountain", :relationship => "Third Son" },
        [ 0, 0, 1 ] => { :name => "Sun", :attribute => "Penetrating", :image => "Wind, Wood", :relationship => "First Daughter" },
        [ 0, 1, 0 ] => { :name => "Li", :attribute => "Light-giving", :image => "Fire", :relationship => "Second Daughter" },
        [ 1, 0, 0 ] => { :name => "Tui", :attribute => "Joyful", :image => "Lake", :relationship => "Third Daughter" },
      }
      @signatures = { 
        [ 0, 0, 0, 0, 0, 0 ] => { :name => "Ch'ien" },
        [ 0, 0, 0, 0, 0, 1 ] => { :name => "Kou" },
        [ 0, 0, 0, 0, 1, 0 ] => { :name => "T'ung Jen" },
        [ 0, 0, 0, 1, 0, 0 ] => { :name => "Lu" },
        [ 0, 0, 1, 0, 0, 0 ] => { :name => "Hsiao Ch'u" },
        [ 0, 1, 0, 0, 0, 0 ] => { :name => "Ta Yu" },          
        [ 1, 0, 0, 0, 0, 0 ] => { :name => "Kuai" },
        [ 0, 0, 0, 0, 1, 1 ] => { :name => "Tun" },
        [ 0, 0, 0, 1, 1, 0 ] => { :name => "Wu Wang" },
        [ 0, 0, 1, 1, 0, 0 ] => { :name => "Chung Fu" },
        [ 0, 1, 1, 0, 0, 0 ] => { :name => "Ta Ch'u" },
        [ 1, 1, 0, 0, 0, 0 ] => { :name => "Ta Chuang" },
        [ 0, 0, 0, 1, 0, 1 ] => { :name => "Sung" },
        [ 0, 0, 1, 0, 1, 0 ] => { :name => "Chia Jen" },
        [ 0, 1, 0, 1, 0, 0 ] => { :name => "K'uei" },
        [ 1, 0, 1, 0, 0, 0 ] => { :name => "Hsu" },
        [ 0, 0, 1, 0, 0, 1 ] => { :name => "Sun" },
        [ 0, 1, 0, 0, 1, 0 ] => { :name => "Li" },
        [ 1, 0, 0, 1, 0, 0 ] => { :name => "Tui" },
        [ 0, 1, 0, 0, 0, 1 ] => { :name => "Ting" },
        [ 1, 0, 0, 0, 1, 0 ] => { :name => "Ko" },
        [ 1, 0, 0, 0, 0, 1 ] => { :name => "Ta Kuo" },
        [ 0, 0, 0, 1, 1, 1 ] => { :name => "P'i" },
        [ 0, 0, 1, 1, 1, 0 ] => { :name => "I" },
        [ 0, 1, 1, 1, 0, 0 ] => { :name => "Sun" },
        [ 1, 1, 1, 0, 0, 0 ] => { :name => "T'ai" },
        [ 0, 0, 1, 1, 0, 1 ] => { :name => "Huan" },
        [ 0, 1, 1, 0, 1, 0 ] => { :name => "Pi" },
        [ 1, 1, 0, 1, 0, 0 ] => { :name => "Kuei Mei" },
        [ 0, 0, 1, 0, 1, 1 ] => { :name => "Chien" },
        [ 0, 1, 0, 1, 1, 0 ] => { :name => "Shih Ho" },
        [ 1, 0, 1, 1, 0, 0 ] => { :name => "Chieh" },
        [ 0, 1, 1, 0, 0, 1 ] => { :name => "Ku" },
        [ 1, 1, 0, 0, 1, 0 ] => { :name => "Feng" },
        [ 0, 1, 0, 0, 1, 1 ] => { :name => "Lu" },
        [ 1, 0, 0, 1, 1, 0 ] => { :name => "Sui" },
        [ 1, 1, 0, 0, 0, 1 ] => { :name => "Heng" },
        [ 1, 0, 0, 0, 1, 1 ] => { :name => "Hsien" },
        [ 1, 0, 0, 1, 0, 1 ] => { :name => "K'un" },
        [ 1, 0, 1, 0, 0, 1 ] => { :name => "Ching" },
        [ 1, 0, 1, 0, 1, 0 ] => { :name => "Chi Chi" },
        [ 0, 1, 0, 1, 0, 1 ] => { :name => "Wei Chi" },
        [ 0, 0, 1, 1, 1, 1 ] => { :name => "Kuan" },
        [ 0, 1, 1, 1, 1, 0 ] => { :name => "I" },
        [ 1, 1, 1, 1, 0, 0 ] => { :name => "Lin" },
        [ 0, 1, 1, 1, 0, 1 ] => { :name => "Meng" },
        [ 1, 1, 1, 0, 1, 0 ] => { :name => "Meng I" },
        [ 0, 1, 1, 0, 1, 1 ] => { :name => "Ken" },
        [ 1, 1, 0, 1, 1, 0 ] => { :name => "Chen" },
        [ 0, 1, 0, 1, 1, 1 ] => { :name => "Chin" },
        [ 1, 0, 1, 1, 1, 0 ] => { :name => "Chun" },
        [ 1, 1, 1, 0, 0, 1 ] => { :name => "Sheng" },
        [ 1, 1, 0, 0, 1, 1 ] => { :name => "Hsiao Kuo" },
        [ 1, 0, 0, 1, 1, 1 ] => { :name => "Ts'ui" },
        [ 1, 0, 1, 1, 0, 1 ] => { :name => "K'an" },
        [ 1, 0, 1, 0, 1, 1 ] => { :name => "Chien" },
        [ 1, 1, 0, 1, 0, 1 ] => { :name => "Hsieh" },
        [ 1, 1, 1, 1, 1, 0 ] => { :name => "Fu" },
        [ 1, 1, 1, 1, 0, 1 ] => { :name => "Shih" },
        [ 1, 1, 1, 0, 1, 1 ] => { :name => "Ch'ien" },
        [ 1, 1, 0, 1, 1, 1 ] => { :name => "Yu" },
        [ 1, 0, 1, 1, 1, 1 ] => { :name => "Pi" },
        [ 0, 1, 1, 1, 1, 1 ] => { :name => "Po" },
        [ 1, 1, 1, 1, 1, 1 ] => { :name => "K'un" },
      }
    end

    # return description of a trigram
    def trigram_description( trigram_signature )
      @trigram_signatures[ trigram_signature ]
    end

    # return description of hexagram    
    def description( signature = self.signature )
      @signatures[ signature ]
    end

    # return array of moving lines
    def moving_lines
      temp = []
      self.each_with_index do | line, index |
         temp << (6 - index) if line[:moving] == true
      end
      temp
    end
    
    # determine if hexagram is moving
    def moving?
      !self.moving_lines.empty?
    end

    def top_signature
      self.signature[ 0, 3 ]
    end

    def bottom_signature
      self.signature[ 3, 6 ]
    end

    # signature returns array of values defining lines of hexagram  
    def signature
      temp = []
      6.times do | i |
        temp << self[ i ][:type] if self[i]
      end
      raise Exception.new('Signature missing lines.') if temp.size < 6
      raise Exception.new('Signature has too many lines.') if temp.size > 6
      temp
    end
    
    # change returns the changed hexagram -- ie, without moving lines
    def change
      temp = IChing::Hexagram.new
      self.each_with_index do | l, index |
        if l[:moving]
          type = IChing::YANG if l[:type] == IChing::YIN
          type = IChing::YIN if l[:type] == IChing::YANG
          temp << { :moving => false, :type => type }
        else
          temp << l
        end
      end
      temp
    end
    
    # render to ascii
    def to_s
      temp = []
      self.each_with_index do | line, index |
        temp << "---o---" if line[:moving] && line[:type] == IChing::YANG    
        temp << "---x---" if line[:moving] && line[:type] == IChing::YIN

        temp << "-------" if !line[:moving] && line[:type] == IChing::YANG    
        temp << "--- ---" if !line[:moving] && line[:type] == IChing::YIN
      end
      temp.join("\n")
    end
       
  end


  # Cast is responsible for dividing the yarrow stalks and determining the hexagram
  class Cast
    
    attr_reader :hexagrams
    
    def initialize( seed = nil )
      # seed random number generator
      srand # should seed from /dev/random
      srand( seed ) unless seed.nil?
      @hexagrams = []
      self.cast()
    end
    
    # perform the division of a given heap of stalks
    def divide( heap )
      heap_right_hand = rand( heap ) + 1
      heap_left_hand  = heap - heap_right_hand
      heap_total = heap_right_hand + heap_left_hand
      
      # take one stalk from right hand heap and store
      stack = []
      stack << 1
      heap_right_hand -= 1
      
      # take stalks from left hand heap in bundles of 4
      # store remainder
      remainder = self.remainder( heap_left_hand )
      stack << remainder
      heap_right_hand += heap_left_hand - remainder
      
      # take stalks from right hand heap in bundles of 4
      # store remainder
      stack << self.remainder( heap_right_hand )
      
      # total number of stalks in stack
      stack_total = stack.inject(0) { | sum, element | sum += element }
      
      # subtract the stack_total from the total_heap
      heap_total -= stack_total
      
      # subtract 1 from stack_total
      stack_total -= 1
      
      # return the actual stack_total, converted total, and heap_total
      return [ stack_total, 2, heap_total ] if ( stack_total == 8 || stack_total == 7 )
      return [ stack_total, 3, heap_total ] if ( stack_total == 4 || stack_total == 3 )
    end
    
    # remainder removes stalks from a given heap in bundles of 4
    # returns remaining stalk count when four or fewer remain
    def remainder( heap )
      temp = heap % 4
      temp = 4 if temp == 0
      temp
    end
    
    # cast_line performs the stalk division three times and adds the converted total
    def cast_line
      sum = 0
      temp = self.divide( 49 )
      sum += temp[1]
      
      temp = self.divide( temp.last )
      sum += temp[1]
      
      temp = self.divide( temp.last )
      sum += temp[1]
      sum
    end
    
    # cast performs the casting of lines
    # resulting hexagram (and changed hexagram if present) is returned
    # and stored in hexagrams instance variable
    def cast
      h = IChing::Hexagram.new()
      6.times do | i |
        temp = self.cast_line()
        
        case temp
        when 9
          h << { :moving => true, :type => IChing::YANG } # OLD YANG ---o---           
        when 7
          h << { :moving => false, :type => IChing::YANG } # YOUNG YANG ---x---
        when 6
          h << { :moving => true, :type => IChing::YIN } # OLD YIN -------
        when 8
          h << { :moving => false, :type => IChing::YIN } # YOUNG YIN --- ---
        end
      end
      
      @hexagrams << h
      @hexagrams << h.change if h.moving?
      @hexagrams
    end
  end
    
end