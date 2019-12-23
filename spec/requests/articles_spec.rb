require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
  let(:user) { create :user } 
  let(:articles) { create_list(:article, 5) }
  let(:article_id) { articles.first.id }
  describe 'GET /articles' do
    before { get '/users/:user_id/articles' }
    it 'returns articles' do
      expect( articles ).not_to be_empty
      expect( articles.size ).to eq(5)
    end

    it 'returns status code 200' do
      articles = articles.to_json
      expect(response.status).to eq 200
    end
  end
end