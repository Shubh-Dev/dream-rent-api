require 'swagger_helper'

describe 'Appointments API' do
  path '/appointments' do
    post 'Creates an appointment' do
      tags 'Appointments'
      consumes 'application/json', 'application/xml'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string },
          time: { type: :string },
          visitors: { type: :integer },
          user_id: { type: :integer },
          house_id: { type: :integer }

        },
        required: %w[date time visitors user_id house_id]
      }

      response '201', 'appointment created' do
        let(:appointment) do
          { date: '2020-10-10 00:00:00', time: '2020-10-10 00:00:00', visitors: 1, user_id: 1, house_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:appointment) do
          { date: '2020-10-10 00:00:00', time: '2020-10-10 00:00:00', visitors: 1, user_id: 1, house_id: 1 }
        end
        run_test!
      end
    end
  end
end
