require 'rails_helper'

describe SearchCountdown do
  it 'takes a query' do
    expect { SearchCountdown.new('test') }.to_not raise_error
  end

  it 'returns an array of results' do
    results = SearchCountdown.for('butter')

    expect(results.size).to be > 1
    expect(results.first).to respond_to(:name, :price)
  end
end
