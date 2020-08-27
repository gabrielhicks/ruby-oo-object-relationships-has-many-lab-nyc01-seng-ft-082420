class Author

    attr_accessor :name
    attr_reader :posts

    def initialize(name)
        @name = name
        @posts = []
    end

    def add_post(post)
        @posts << post
        post.author = self
    end

    def add_post_by_title(title)
        Post.new(title).author = self
    end

    def posts
        Post.all.select do |post|
            post.author = self
        end
    end

    def self.post_count
        Post.all.count
    end
end