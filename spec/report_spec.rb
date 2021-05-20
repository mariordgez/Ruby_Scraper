require_relative '../lib/report'
describe Report do
  let(:report) { Report.new }
  describe '#report_averages' do
    it 'Should print the string compare_output' do
      compare_output = "Throughout the 2020-21 season, mario is averaging 5 ppg, 6 assists,\n "\
      "7 rebounds while shooting 45.0% from the field\n"
      expect { report.report_averages('mario', 5, 6, 7, 0.45) }.to output(compare_output).to_stdout
    end
    it 'Should not print the string not + compare_output' do
      compare_output = "Throughout the 2020-21 season, mario is averaging 5 ppg, 6 assists,\n "\
      "7 rebounds while shooting 45.0% from the field\n"
      expect { report.report_averages('mario', 5, 6, 7, 0.45) }.not_to output("not#{compare_output}").to_stdout
    end
  end
  describe '#report_last_ten' do
    it 'Should print the string compare_output' do
      compare_output = "During his last 10 games, mario is averaging 5 ppg, 6 assists,\n "\
      "7 rebounds while shooting 45.0% from the field.\n"
      expect { report.report_last_ten('mario', 5, 6, 7, 0.45) }.to output(compare_output).to_stdout
    end
    it 'Should not print the string not + compare_output' do
      compare_output = "During his last 10 games, mario is averaging 5 ppg, 6 assists,\n "\
      "7 rebounds while shooting 45.0% from the field.\n"
      expect { report.report_last_ten('mario', 5, 6, 7, 0.45) }.not_to output("not#{compare_output}").to_stdout
    end
  end
  describe '#season_avr_arr' do
    it 'Should return an array with the arguments passed to the method' do
      expect(report.season_avr_arr(50, 20, 20, 0.45)).to eql([50, 20, 20, 0.45])
    end
    it 'Should not return an array with the arguments on different order' do
      expect(report.season_avr_arr(50, 20, 20, 0.45)).not_to eql([20, 50, 20, 0.45])
    end
  end
  describe '#last_ten_arr' do
    it 'Should return an array with the arguments passed to the method' do
      expect(report.last_ten_arr(50, 20, 20, 0.45)).to eql([50, 20, 20, 0.45])
    end
    it 'Should not return an array with the arguments on different order' do
      expect(report.last_ten_arr(50, 20, 20, 0.45)).not_to eql([20, 50, 20, 0.45])
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
  describe '#player_cold?' do
    it 'should return true if arg is >5' do
      expect(report.player_cold?(6)).to eql(true)
    end
    it 'should not return true if arg is <5' do
      expect(report.player_cold?(3)).not_to eql(true)
    end
  end
  describe '#compare' do
    it 'should return 3 since player is currently hot' do
      array1 = [20, 7, 7, 0.50]
      array2 = [25, 9, 7, 0.50]
      expect(report.compare(array1, array2)).to eql(3)
    end
    it 'should return 2 since player is within his normal averages' do
      array1 = [20, 7, 7, 0.50]
      array2 = [21, 8, 6, 0.48]
      expect(report.compare(array1, array2)).to eql(2)
    end

    it 'should return 1 since player is playing below his usual standards' do
      array1 = [20, 7, 7, 0.50]
      array2 = [15, 8, 6, 0.41]
      expect(report.compare(array1, array2)).to eql(1)
    end
  end
  describe '#end_report' do
    it 'Should be equal to the output since player condition matches' do
      report.player_condition = 1
      compare_output = "mark is currently having a cold streak, you probably shouldnt expect him to have huge numbers\n"
      expect { report.end_report('mark') }.to output(compare_output).to_stdout
    end
    it 'Should be equal to the output since player condition matches' do
      report.player_condition = 2
      compare_output = "mario is currently playing like he normally does\n"
      expect { report.end_report('mario') }.to output(compare_output).to_stdout
    end
    it 'Should be equal to the output since player condition matches' do
      report.player_condition = 3
      compare_output = "mark is on fire!, he is a great pick to bet on and expect him to keep playing well\n"
      expect { report.end_report('mark') }.to output(compare_output).to_stdout
    end
    it 'Should be equal to the output since player condition matches' do
      report.player_condition = 0
      compare_output = "No report at the moment\n"
      expect { report.end_report('mario') }.to output(compare_output).to_stdout
    end
    it 'Should not be equal to the output since player condition doesnt match' do
      report.player_condition = 3
      compare_output = "mario is currently playing like he normally does\n"
      expect { report.end_report('mario') }.not_to output(compare_output).to_stdout
    end
  end
end
