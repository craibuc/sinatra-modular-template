require 'json'
require "rspec-html-matchers"
# require 'sinatra/flash'

describe RootController do
  include RSpecHtmlMatchers

  subject(:app) { RootController }

  context "GET /" do

    let(:response) { get "/" }

    example "returns status 200 OK" do
      expect(response.status).to eq 200
    end

    example "includes the title in a H1 element" do
      expect(response.body).to include('<h1>Root</h1>')
    end

  end # /context

  context "GET /env" do

    let(:response) { get "/env" }

    example "returns status 200 OK" do
      expect(response.status).to eq 200
    end

    example "includes the title in a H1 element" do
      expect(response.body).to include('<h1>Environment</h1>')
    end

  end # /context

  context "GET /dummy" do

    let(:response) { get "/dummy" }

    example "returns status 404 NOT FOUND" do
      expect(response.status).to eq 404
    end

    example "includes the title in a H1 element" do
      expect(response.body).to include('<h1>Not Found [401]</h1>')
    end

  end # /context

  context "GET /protected" do

    let(:response) { get "/protected" }

    example "returns status 403 FORBIDDEN" do
      expect(response.status).to eq 403
    end

    example "includes the title in a H1 element" do
      expect(response.body).to include('<h1>Forbidden [403]</h1>')
    end

  end # /context

  context "GET /json" do

    let(:response) { get "/json" }

    example "returns status 200 OK" do
      expect(response.status).to eq 200
    end

    example "returns content in JSON format" do
      expect(response.headers['Content-Type']).to eq('application/json')
    end

    example "includes a 'results' element" do
      expect(JSON.parse(response.body)['results']).not_to be_nil
    end

  end # /context

  context "GET /flash" do

    let!(:response) { get "/flash" }

    example "returns status 200 OK" do
      expect(response.status).to eq 200
    end

    xexample "includes alerts" do
      expect(response.body).to have_tag(:div, :with => { :class => 'alert alert-info alert-dismissible' })
      expect(response.body).to have_tag(:div, :with => { :class => 'alert alert-success alert-dismissible' })
      expect(response.body).to have_tag(:div, :with => { :class => 'alert alert-warning alert-dismissible' })
      expect(response.body).to have_tag(:div, :with => { :class => 'alert alert-danger alert-dismissible' })
    end

  end # /context

end # /describe
