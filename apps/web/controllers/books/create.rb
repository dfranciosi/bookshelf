module Web::Controllers::Books
  class Create
    include Web::Action

    params do
      required(:book).schema do
        required(:book).value(:str?, format?: /\AHello/)
      end
    end

    def call(params)
      if params.valid?
        @book = BookRepository.new.create(params[:book])
        redirect_to '/'
      end
    end
  end
end
