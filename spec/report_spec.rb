require_relative '../lib/report'
describe Report do
let (:report) {Report.new}
describe '#report_averages' do
it 'Should print the string compare_output' do
compare_output="Throughout the 2020-21 season, mario is averaging 5 ppg, 6 assists,\n "\
"7 rebounds while shooting 45.0% from the field\n"
expect{report.report_averages('mario',5,6,7,0.45)}.to output(compare_output).to_stdout
end
it 'Should not print the string not + compare_output' do
  compare_output="Throughout the 2020-21 season, mario is averaging 5 ppg, 6 assists,\n "\
  "7 rebounds while shooting 45.0% from the field\n"
  expect{report.report_averages('mario',5,6,7,0.45)}.not_to output('not' + compare_output).to_stdout
  end

end
describe '#report_last_ten' do
it 'Should print the string compare_output' do
compare_output="During his last 10 games, mario is averaging 5 ppg, 6 assists,\n "\
"7 rebounds while shooting 45.0% from the field.\n"
expect{report.report_last_ten('mario',5,6,7,0.45)}.to output(compare_output).to_stdout
end
it 'Should not print the string not + compare_output' do
  compare_output="During his last 10 games, mario is averaging 5 ppg, 6 assists,\n "\
  "7 rebounds while shooting 45.0% from the field.\n"
  expect{report.report_last_ten('mario',5,6,7,0.45)}.not_to output('not' + compare_output).to_stdout
  end

end
describe '#season_avr_arr' do
it 'Should return an array with the arguments passed to the method' do
expect(report.season_avr_arr(50,20,20,0.45)).to eql([50,20,20,0.45])
end
it 'Should not return an array with the arguments on different order' do
  expect(report.season_avr_arr(50,20,20,0.45)).not_to eql([20,50,20,0.45])
  end
end
describe '#last_ten_arr' do
it 'Should return an array with the arguments passed to the method' do
expect(report.last_ten_arr(50,20,20,0.45)).to eql([50,20,20,0.45])
end
it 'Should not return an array with the arguments on different order' do
  expect(report.last_ten_arr(50,20,20,0.45)).not_to eql([20,50,20,0.45])
  end
end
describe '#player_hot?' do
it 'should return true if arg is <-5' do
expect(report.player_hot?(-10)).to eql(true)
end
it 'should not return true if arg is >-5' do
  expect(report.player_hot?(-4)).not_to eql(true)
  end

end
end
