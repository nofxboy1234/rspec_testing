require './lib/router'
# require './lib/blog'
# require './lib/post'

RSpec.describe Router do
  subject { described_class.new(domain: 'bloggo.com') }

  describe '#url_for' do
    it 'returns the full URL with protocol, subdomain, and path' do
      blog = double('Blog', subdomain: 'brettcodes')

      # blog = double('Blog')
      # allow(blog).to receive(:subdomain).and_return('brettcodes')

      post = double('Post', slug: 'using-rspec-test-doubles', blog: blog)
      
      expect(subject.url_for(post)).to eql(
        'https://brettcodes.bloggo.com/using-rspec-test-doubles'
      )
    end
  end
end
