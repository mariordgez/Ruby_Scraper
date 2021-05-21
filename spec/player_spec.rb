require_relative '../lib/player'
describe Player do
  let(:player) { Player.new }
  describe '#get_points' do
    context 'It returns the average of the sum of the numbers of an array' do
      it 'Should return the average of the sum of the array' do
        arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        expect(player.averages(arr)).to eql(6)
      end
      it 'Should not round up even if number is closer to bigger number' do
        arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12]
        expect(player.averages(arr)).not_to eql(7)
      end
    end
  end
end
