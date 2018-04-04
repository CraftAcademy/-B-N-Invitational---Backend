RSpec.describe Api::V1::ResultsController, type: :request do
  describe 'GET api/v1/results' do
    let!(:athlete) { create(:athlete) }
    let!(:athlete_2) { create(:athlete, name: 'Lara') }
    let!(:athlete_3) { create(:athlete, name: 'Kalle') }
    let!(:result) { create( :result, athlete: athlete_2, score: 9.5) }
    let!(:result_2) { create( :result, athlete: athlete, score: 10.0) }
    let!(:result_3) { create( :result, athlete: athlete_3, score: 5.0) }
    let(:object) { JSON.parse(response.body)}

    it 'should return a list of all results' do
      get '/api/v1/results'
      expected_response = eval(file_fixture('results.txt').read)
      expect(object).to eq expected_response
    end
  end
end
