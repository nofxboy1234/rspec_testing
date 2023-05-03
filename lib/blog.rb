class blog
  attr_reader :title, :subdomain, :posts

  def initialize(title:, subdomain:)
    @title = title
    @subdomain = subdomain
    @posts = []
  end

  def add_post(title:, content:)
    post = Post.new(title: title, content: content, blog: self)
    @posts << post
    post
  end
end