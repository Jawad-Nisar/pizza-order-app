json.extract! order, :id, :completed, :promotion_code, :discount_code, :items_id, :created_at, :updated_at
json.url order_url(order, format: :json)
