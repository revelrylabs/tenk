require 'spec_helper'

describe Tenk::Projects::Users do
  subject(:user) { Tenk.new.projects.users }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_users', record: :new_episodes do
        user.list(183760)
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end
end
