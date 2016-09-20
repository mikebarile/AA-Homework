class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    assigned = false
    @map.map! do |arr|
      if arr[0] == key
        assigned = true
        [key, value]
      else
        arr
      end
    end
    @map << [key, value] if assigned == false
  end

  def lookup(key)
    @map.each{ |arr| return arr[1] if arr[0] == key}
  end

  def remove(key)
    @map.reject!{ |arr| arr[0] == key}
  end

  def show
    p @map
  end
end

m = Map.new
m.assign("happy", "days")
m.assign("killer", "swell")
m.assign("young", "thug")
m.show
m.assign("happy", "nights")
m.remove("killer")
m.show
p m.lookup("young")
