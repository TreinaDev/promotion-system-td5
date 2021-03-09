require 'rails_helper'

describe RandomWord do
  it 'should print Campus if less than 0.5' do
    allow(Random).to receive(:rand).and_return(0.49)

    word = RandomWord.random()

    expect(word).to eq 'Campus'
  end

  it 'should print Campus if less than 0.5' do
    allow(Random).to receive(:rand).and_return(0.51)

    word = RandomWord.random()

    expect(word).to eq 'Code'
  end
end