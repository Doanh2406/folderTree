class Folder < ApplicationRecord
   scope :subtree_of, ->(folder) {
    where("path LIKE ?", "#{folder.path}/%").order(:path)
  }

  # lấy parent id từ path
  def parent_id
    parts = path.split("/")
    return nil if parts.length <= 1
    parts[-2].to_i
  end

  # build tree từ list node
  def self.build_tree(nodes)
    map = {}

    nodes.each do |node|
      map[node.id] = {
        id: node.id,
        name: node.name,
        path: node.path,
        children: []
      }
    end

    
    root = nil

    nodes.each do |node|
      parent_id = node.parent_id

      if parent_id && map[parent_id]
        map[parent_id][:children] << map[node.id]
      else
        root = map[node.id]
      end
    end

    root
  end

  # load subtree + build tree
  def subtree_tree
    nodes = Folder.subtree_of(self)
    Folder.build_tree([self] + nodes)
  end
end
