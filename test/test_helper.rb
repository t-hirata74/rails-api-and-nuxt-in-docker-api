ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# gem minitest-teporters setup
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # 並列テスト ... 複数のプロセスを分岐させテスト時間の短縮を行う機能
  # 
  # プロセスが分岐した直後に呼び出し
  parallelize_setup do |worker|
    # seedデータの読み込み
    load "#{Rails.root}/db/seeds.rb"
  end
  # Run tests in parallel with specified workers
  # 並列テストの有効化・無効化
  # workers: プロセス数を渡す(2以上 => 有効、2未満 => 無効)
  parallelize(workers: :number_of_processors)

  # アクティブなユーザーを返す
  def active_user
    User.find_by(activated: true)
  end
end
