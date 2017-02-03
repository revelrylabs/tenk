require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe Tenk::Projects::Tags do
  subject(:tags) { Tenk.new.projects.tags }

  it { should respond_to :list }
  it { should respond_to :add }
  it { should respond_to :remove }

  describe '#list' do
    subject do
      VCR.use_cassette 'list_tags', record: :new_episodes do
        tags.list(183760)
      end
    end

    it { should respond_to :data }

    describe '#data' do
      it { should respond_to :length }
    end
  end

  describe '#add' do
    subject(:add_tag_response) do
      VCR.use_cassette 'add_tags', record: :new_episodes do
        tags.add(183760, 'test')
      end
    end

    it { should respond_to :value }

    describe '#remove' do
      subject do
        VCR.use_cassette 'delete_tag', record: :new_episodes do
          tags.remove(183760, add_tag_response.id)
        end
      end

      it { should eq true }
    end
  end
end
