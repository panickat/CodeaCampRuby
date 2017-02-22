require 'rspec'
require_relative '../config/application'

describe "create table with correct schema" do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "should have a Users table" do
    #table_exists? DEPRECATION WARNING: #table_exists? currently checks both tables and views. This behavior is deprecated and will be changed with Rails 5.1 to only check tables. Use #data_source_exists? instead.
    expect(ActiveRecord::Base.connection.data_source_exists?(:users)).to eq(true)
  end

  it "should have the right columns and types" do
    expected = {
      :integer => ["id"],
      :string => ["first_name", "last_name", "gender", "email", "phone"],
      :date => ["birthday"],
      :datetime =>['created_at', 'updated_at']
    }

    ActiveRecord::Base.connection.columns(:users).each do |col|
      expect(expected[col.type].include?(col.name)).to eq(true)
    end
  end
end
