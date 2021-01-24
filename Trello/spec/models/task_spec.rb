require 'rails_helper'

RSpec.describe Task do
  let(:task) { described_class.new(title: title) }
  describe '#save' do
    context 'when task without list' do
      let(:title) { 'ab' }
      it 'returns error' do
        expect(task.save).to be_falsy
      end
    end
  end
end
