require 'pg'

class ToDo

  attr_reader :id, :title, :conn

  def initialize(params, conn)
    @id = params['id']
    @title = params['title']
    @conn = conn
  end

  def save
    res = conn.exec("INSERT into todos(title) values('#{@title}') returning id")
    @id  = res[0]['id']
    res
  end

  def delete
    @conn.exec("DELETE FROM todos WHERE id = #{@id}")
  end

  def update(title)
    @conn.exec("UPDATE todos SET title='#{title}' WHERE id=#{@id}")
  end

  def self.all (conn)
    conn.exec("SELECT * FROM todos")
  end

  def self.where(params, conn)
    if (params['id'] == nil) and (params['title'] == nil)
      res = nil
    elsif (params['id'] == nil)
    res = conn.exec("SELECT * FROM todos WHERE title ='#{params['title']}'")
    else
      res = conn.exec("SELECT * FROM todos WHERE id = #{params['id']}")
    end
    res
  end

#  def self.arr_map(arr_hashs)
#  	res_hashs = []
#		arr_hashs.each do |el|
#			todo = ToDo.new(el['title'])
#			todo.id = el['id']
#			res_hashs << todo
#		end
#		res_hashs
#  end

end
