require 'spec_helper'

RSpec.describe Sinatra::Application do
  def app
    Sinatra::Application
  end

  describe 'GET /events' do
    context 'no event' do
      it 'returns no event' do
        get '/api/v1/'

        expect(last_response.headers['Content-Type']).to eq('application/json')
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)['msg']).to eq('Nenhum evento criado')
      end
    end

    context 'show events' do
      it 'returns event details' do
        event1 = Event.new(name: 'Reuniao',
                          guests: ['mm@rebase','nn@rebase'], start_at: '21/08/2021 - 2:00',
                          end_at: '22/08/2021 - 3:00', local: 'Online', owner: 'mm@rebase',
                          description: 'Daily')
        event2 = Event.new(name: 'Festa',
                          guests: ['aa@rebase','bb@rebase'], start_at: '21/08/2021 - 2:00',
                          end_at: '22/08/2021 - 3:00', local: 'Presencial', owner: 'aa@rebase',
                          description: 'novo evento')
        $db = [event1, event2]

        get '/api/v1/'

        expect(last_response.headers['Content-Type']).to eq('application/json')
        expect(last_response.status).to eq 200
        response = JSON.parse(last_response.body).first
        expect(response['name']).to eq('Reuniao')
        expect(response['guests']).to eq(['mm@rebase','nn@rebase'])
        expect(response['start_at']).to eq('21/08/2021 - 2:00')
        expect(response['end_at']).to eq('22/08/2021 - 3:00')
        expect(response['local']).to eq('Online')
        expect(response['owner']).to eq('mm@rebase')
        expect(response['description']).to eq('Daily')
      end
    end
  end
end