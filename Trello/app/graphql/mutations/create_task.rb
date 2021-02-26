module Mutations
  class CreateTask < Mutations::BaseMutation
    argument :title, String, required: true
    argument :list_id, Integer, required: true

    type Types::TaskType


    def resolve(title:, list_id:)
      Task.create!([title: title, list_id: list_id])
    end
  end
end