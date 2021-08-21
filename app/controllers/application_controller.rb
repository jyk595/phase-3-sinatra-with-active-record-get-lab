class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries=Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery=Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods=BakedGood.all
    baked_goods.sort_by(&:price).reverse.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods=BakedGood.all
    baked_goods.sort_by(&:price).last.to_json
  end
end
