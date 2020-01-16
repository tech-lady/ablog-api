require 'rails_helper'

RSpec.describe 'Comments API', type: :request do
  let(:user) { create(:user) }
  let!(:article) { create(:article, user_id: user.id) }
  let!(:comments) { create_list(:comment, 10, article_id: article.id) }
  let(:article_id) { article.id }
  let(:id) { comments.first.id }
  let(:headers) { valid_headers }

  describe 'GET /articles/:article_id/comments' do
    before { get "/articles/#{article_id}/comments", params: {}, headers: headers }

    context 'when article exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all comments for an article' do
        expect(comments.size).to eq(10)
      end
    end

    context 'when article does not exist' do
      let(:article_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Article/)
      end
    end
  end

  describe 'GET /articles/:article_id/comments/:id' do
    before { get "/articles/#{article_id}/comments/#{id}", params: {}, headers: headers }

    context 'when a comment exists for an article' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the comment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }
      it 'returns status 404 code' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'POST /articles/:article_id/comments' do
    let(:valid_attributes) { { name: 'My comment', content: 'I have commented', visible: false }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/articles/#{article_id}/comments", params: valid_attributes, headers: headers
      end 

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/articles/#{article_id}/comments", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /articles/:article_id/comments/:id' do
    let(:valid_attributes) { { name: 'Openuser' }.to_json }

    before do
      put "/articles/#{article_id}/comments/#{id}", params: valid_attributes, headers: headers
    end

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.name).to match(/Openuser/)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'DELETE /comments/:id' do
    before { delete "/articles/#{article_id}/comments/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
