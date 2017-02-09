class TodoList

  def initialize(list)
    @list = list
  end

  def get_items
    return @list
  end

  def add_item(task)
    @list << task
    return @list
  end

  def delete_item(task)
    @list.delete(task)
    return @list
  end
end