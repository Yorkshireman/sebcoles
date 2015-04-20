json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :content
  json.url testimonial_url(testimonial, format: :json)
end
