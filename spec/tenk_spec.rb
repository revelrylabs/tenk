require 'spec_helper'

describe Tenk do
  it { should respond_to :new }

  it { expect(subject.new).to be_a Tenk::Client }
end
