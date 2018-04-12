RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'POST /api/v1/athletes/id' do
    let!(:athlete) {create(:athlete)}
    let!(:result) {create(:result, athlete: athlete)}
    let(:document){JSON.parse(response.body)}
    let(:object) { document['status'] }

    it 'should return sucess message if updated' do
      post "/api/v1/athletes/voting/#{athlete.id}", params: {
        vote: 10.0
       }

      expect(object).to eq 'Thank you for casting your vote!'
    end

    it 'should update an athletes score' do
      post "/api/v1/athletes/voting/#{athlete.id}", params: {
        vote: 10.0
      }

      result = Result.first
      expect(result.score).to eq 10.0
    end
  end
end
