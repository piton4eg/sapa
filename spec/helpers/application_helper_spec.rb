require "rails_helper"

describe ApplicationHelper do
  describe '#current_link_to' do
    let(:label) { 'Link Title' }
    let(:path) { 'Link Path' }

    it 'has li tag' do
      expect(helper.current_link_to(label, path)).to have_css 'li'
    end

    context 'when path is current_page' do
      before do
        allow(helper).to receive(:current_page?).and_return(true)
      end
      it 'has active class' do
        expect(helper.current_link_to(label, path)).to have_css 'li.active'
      end
    end

    context 'when path is not current_page' do
      before do
        allow(helper).to receive(:current_page?).and_return(false)
      end
      it 'has not active class' do
        expect(helper.current_link_to(label, path)).not_to have_css 'li.active'
      end
    end
  end

  describe '#full_title' do
    context 'when page_title is nil' do
      let(:page_title) { nil }
      it 'contains base title' do
        expect(helper.full_title(page_title)).to eq I18n.t('title')
      end
    end

    context 'when page_title is empty' do
      let(:page_title) { "" }
      it 'contains base title' do
        expect(helper.full_title(page_title)).to eq I18n.t('title')
      end
    end

    context 'when page_title present' do
      let(:page_title) { "Title" }
      it 'contains title and base title' do
        expect(helper.full_title(page_title)).to eq "#{page_title} - #{I18n.t('title')}"
      end
    end
  end
end
