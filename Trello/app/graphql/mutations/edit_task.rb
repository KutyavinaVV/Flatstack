module Mutations
  class EditTask < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true

    type Types::TaskType

    def resolve(title:, id:)
      task = Task.find(id)
      task.update!(title: title)
      task
    end
  end
end
