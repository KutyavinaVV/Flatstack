module Types
  class MutationType < Types::BaseObject
    field :create_list, mutation: Mutations::CreateList
    field :create_task, mutation: Mutations::CreateTask
    field :delete_list, mutation: Mutations::DeleteList
    field :edit_list, mutation: Mutations::EditList
    field :destroy_task, mutation: Mutations::DestroyTask
    field :edit_task, mutation: Mutations::EditTask
  end
end
