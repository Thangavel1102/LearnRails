require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { build(:article, title: 'Ruby', content: 'Programming language') }

  it { expect(article).to be_valid }

  it 'title should be present' do
    article.title = ''
    expect(article).not_to be_valid
  end
end
