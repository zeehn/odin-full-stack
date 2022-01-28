class Player 
    attr_reader :name, :sign
    def initialize(name, sign)
        @name = name.capitalize 
        @sign = sign.capitalize 
    end
end