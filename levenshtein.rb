class Graph
  def initialize
    @adjacency_list = {}
    @vertices_count = 0
  end

  def add_vertex(vertex)
    @adjacency_list[vertex] = []
    @vertices_count += 1
  end
end
