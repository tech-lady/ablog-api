require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
  let(:user) { create :user } 
  let(:articles) { create_list(:article, 5, user_id: user.id) }
  let(:article_id) { articles.first.id }
  let(:headers) { valid_headers }

  describe 'GET /articles' do
    before { get '/articles', params: {}, headers: headers }

    it 'returns all articles' do
      expect(articles).not_to be_empty
      expect(articles.size).to eq(5)
    end
  end

  describe 'GET /articles/:id' do
    before { get "/articles/#{article_id}", params: {}, headers: headers }
    # let(:article) { Article.create(title: 'Title One', content: 'Content One', user_id: 1) }
    context 'When an article exists' do
      it 'returns an article by its unique id' do
        expect(response).to have_http_status (200)
      end
    end

    context 'when the record does not exist' do
      let(:article_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Article/)
      end
    end
  end

  describe 'POST /articles' do
    let(:valid_attributes) do
      { title: 'Title One', content: 'Content One', author: 'OllyBaby', user_id: user.id.to_s }.to_json
    end 
    context 'when a new article is created' do
      before { post '/articles', params: valid_attributes, headers: headers }
      it 'returns success message' do
        expect(response).to have_http_status (201)
      end
    end
  end

  describe 'PUT /articles/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }
    context 'When an article is updated' do
      before { put "/articles/#{article_id}", params: valid_attributes, headers: headers }
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /articles/:id' do
    before { delete "/articles/#{article_id}", params: {}, headers: headers }
    context 'When an article is deleted' do
      it 'returns success message' do
        expect(response).to have_http_status(204)
      end
    end
  end
end