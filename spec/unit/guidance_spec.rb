require './app/models/guidance'

describe Guidance do
  describe '#list' do
    it 'returns guidance' do

      guidance = Guidance.create(url: 'https://www.gov.uk/guidance/vat-guide-notice-700', country: 'UK', description: 'UK VAT guidance notice 700')
      Guidance.create(url: 'https://www.gov.uk/government/collections/vat-manuals', country: 'UK', description: 'UK HMRC VAT internal manuals')

      guidance_list = Guidance.list
      p guidance

      expect(guidance_list.length).to eq 2
      expect(guidance_list.first).to be_a Guidance
      expect(guidance_list.first.id).to eq guidance.id
      expect(guidance_list.first.description).to eq 'UK VAT guidance notice 700'
      expect(guidance_list.first.url).to eq 'https://www.gov.uk/guidance/vat-guide-notice-700'
    end
  end
end
