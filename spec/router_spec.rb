require './lib/router'
require './lib/blog'
require './lib/post'

RSpec.describe Router do
  subject { described_class.new(domain: 'bloggo.com') }

  describe '#url_for' do
    it 'returns the full URL with protocol, subdomain, and path' do
      blog = Blog.new(title: 'Brett Codes', subdomain: 'brettcodes')
      post = Post.new(title: 'Using RSpec Test Doubles',
                      content: 'Some stuff', blog: blog)
      
      expect(subject.url_for(post)).to eql(
        'https://brettcodes.bloggo.com/using-rspec-test-doubles'
      )
    end
  end
end
