require 'swagger_helper'

describe 'Users API' do
  path '/users' do
    post 'creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }
      response '201', 'user created' do
        let(:user) { { name: 'Juan' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'Juan' } }
        run_test!
      end
    end
  end
  path '/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string }
               },
               required: %w[id name]

        let(:id) { User.create(name: 'Juan').id }
        run_test!
      end

      response '404', 'user not found' do
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
