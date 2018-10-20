require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should have_valid(:name).when("mock-coding-challenge") }
  it { should_not have_valid(:name).when(nil, "") }
  it { should have_valid(:owner).when("jmarsto") }
  it { should_not have_valid(:owner).when(nil, "") }
end
