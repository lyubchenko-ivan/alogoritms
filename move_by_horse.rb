class Desk
  attr_reader :rows, :cols

  def initialize(knight)
    @rows = 8
    @cols = 8
    @knight = knight
  end


end

class Knight
  attr_accessor :start_coord, :finish_coord

  def initialize(start, finish)
    @start_coord = start
    @finish_coord = finish
  end

end


class Node
  attr_accessor :coordinats, :childs, :parent
  def initialize (coordinats, parent = nil)
    @coordinats = coordinats
    @parent = parent
  end

  def get_childs
    @childs = []
    x = nil
    y = nil

    8.times do |i|
      new_coordinates = []

      x = -2 if i < 2
      x = -1 if (i >= 2) && (i < 4)
      x = 1 if (i >= 4) && (i < 6)
      x = 2 if i >= 6

      new_coordinates << self.coordinats[0] + x

      y = 1 if x.abs == 2
      y = 2 if x.abs == 1
      y = -y if i % 2 != 0
      new_coordinates << self.coordinats[1] + y

      next if ((new_coordinates[0] > 8) || (new_coordinates[0] < 1)) || ((new_coordinates[1] < 1) || (new_coordinates[1] > 8))
      @childs << Node.new(new_coordinates, self)
    end
  end



end




def knight_moves(start, finish)
  knight = Knight.new(start, finish)
  desk = Desk.new(knight)

  start = Node.new(start)
  start.get_childs
  to_explore = []
  visited = []

  to_explore << start
  visited << start

  while(!to_explore.empty?)

    node = to_explore.slice!(0)

    if node.coordinats == finish
      return  get_moves(node)
    end
    node.get_childs
    node.childs.each {|elem| to_explore << elem; visited << elem }
  end

end

def get_moves(node)
  moves = 0
  while (!node.parent.nil?)
    moves += 1
    print node.coordinats
    puts
    node = node.parent
  end

  print node.coordinats
  puts
  return  moves
end

puts knight_moves([4,4],  [5, 4])
