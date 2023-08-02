require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'Should back with correct response' do
      get '/users/2/posts'
      expect(response).to have_http_status(200)
    end

    it 'Should render index view' do
      get '/users/2/posts'
      expect(response).to render_template('posts/index')
      expect(response.body).to include('posts_index')
    end

    it 'Should render show view' do
      get '/users/2/posts/3'
      expect(response).to render_template('posts/show')
      expect(response.body).to include('posts_show')
    end
  end
end
