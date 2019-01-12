require_relative "tree_node"

class KnightPathFinder

    attr_reader :root_node

    def initialize(start_pos)

        @root_node = PolyTreeNode.new(start_pos)
        build_move_tree
    end

    def build_move_tree
        q = []
        q << root_node
        until q.empty?

        end 


    end

    def self.valid_moves(pos)
        @cons_pos = [pos] if !cons_pos.include?(pos)
    end 

    def new_move_pos(pos)
        KnightPathFinder.valid_moves(pos)
    end 
end
