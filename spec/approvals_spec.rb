require 'spec_helper'

describe Tenk::Approvals do
  subject(:approval) { Tenk::Approvals.new(Tenk.new) }

  it { should respond_to :list }
  it { should respond_to :get }
  it { should respond_to :update }
  it { should respond_to :create }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_approvals', record: :new_episodes do
        approval.list
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#get' do
    subject do
      VCR.use_cassette 'get_approvals', record: :new_episodes do
        approval.get(5059)
      end
    end

    it { should respond_to :status }
  end

  # FIXME: UPDATE doesn't work through API due to permissions of API users

  # describe '#update' do
  #   subject do
  #     VCR.use_cassette 'update_approvals', record: :new_episodes do
  #       approval.update(183760, name: 'Test')
  #     end
  #   end
  #
  #   it { should respond_to :name }
  # end

  # FIXME: CREATE doesn't work through API due to permissions of API users

  # describe '#create' do
  #   subject do
  #     VCR.use_cassette 'create_approvals', record: :new_episodes do
  #       approval.create(name: 'Test2')
  #     end
  #   end
  #
  #   it { should respond_to :name }
  # end
end
