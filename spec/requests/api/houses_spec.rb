require 'swagger_helper'

describe 'Houses API' do
  path '/houses' do
    post 'Creates a house' do
      tags 'Houses'
      consumes 'application/json', 'application/xml'
      parameter name: :house, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          price: { type: :integer },
          address: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[name description price address user_id]
      }

      response '201', 'house created' do
        let(:house) do
          { name: 'Casa', description: 'Casa de playa', price: 200, address: 'Calle falsa 123', user_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:house) do
          { name: 'Casa', description: 'Casa de playa', price: 200, address: 'Calle falsa 123', user_id: 1 }
        end
        run_test!
      end
    end
  end
  path '/houses/{id}' do
    get 'Retrieves a house' do
      tags 'Houses'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'house found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 price: { type: :integer },
                 address: { type: :string },
                 user_id: { type: :integer }
               },
               required: %w[id name description price address user_id]

        let(:id) do
          House.create(name: 'Casa', description: 'Casa de playa', price: 200, address: 'Calle falsa 123',
                       user_id: 1).id
        end
        run_test!
      end

      response '404', 'house not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
