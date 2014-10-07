require 'spec_helper'

describe "Rounds" do
  let!(:user) { FactoryGirl.create(:user) }

  describe "GET /rounds" do
    subject(:json) do
      get '/api/rounds', format: :json
      JSON.parse(response.body)
    end
    context "if user hasn't played any rounds " do
      it { expect(json).to eql ({"rounds" => []}) }
    end
    context "if user played 3 rounds" do
      before do
        3.times { FactoryGirl.create(:scorecard, user: user) }
      end
      it { expect(json["rounds"].size).to eql 3 }
      it 'embeds the round' do
        scorecard_1 = json["rounds"].first
        expect(scorecard_1.keys).to include "round"
        expect(scorecard_1["round"].keys).to include "course"
        expect(scorecard_1["round"]["course"].keys).to include "name"
      end
    end
  end
end
