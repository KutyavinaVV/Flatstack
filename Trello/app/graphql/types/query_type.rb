module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # lists
    field :lists, [Types::ListType], null: true
    field :list, Types::ListType, null: true do
      argument :id, Integer, required: true
    end
    def lists
      List.all
    end

    def list(id:)
      List.find(id)
    end

    # tasks
    field :tasks, [Types::TaskType], null: true
    field :task, Types::TaskType, null: true do
      argument :id, Integer, required: true
    end
    def tasks
      Task.all
    end

    def task(id:)
      Task.find(id)
    end
  end
end
