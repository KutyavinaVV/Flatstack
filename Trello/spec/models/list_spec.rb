require 'rails_helper'

RSpec.describe List do
  let(:list) { described_class.new(title: title) }
  describe '#save' do
    context 'when title has less than 3 characters' do
      let(:title) { 'ab' }
      it 'returns error' do
        expect(list.save).to be_falsy
      end
    end
    context 'when title has more than 3 characters' do
      let(:title) { 'abcd' }
      it 'returns error' do
        expect(list.save).to be_truthy
      end
    end
  end
end
