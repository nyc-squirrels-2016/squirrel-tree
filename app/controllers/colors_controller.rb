get '/colors' do
  letters = 0.upto(9).to_a + 'A'.upto('F').to_a
  { color: "##{letters.sample(6).join('')}" }.to_json
end
