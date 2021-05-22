class Mutations::CreateOrder < Mutations::BaseMutation
    argument :description, String, required: false
    argument :total, Float, required: false

    field :order, [OrderType], null: false
    field :errors, [String], null: false

    def resolve(description:, total:)
        order = Order.new(description: description, total: total, reference_key: SecureRandom.uuid)
        if order.save
            {
                order: order,
                errors: []
            }
        else
            {
                order: nil,
                errors: order.errors.full_messages
            }
        end
    end
end