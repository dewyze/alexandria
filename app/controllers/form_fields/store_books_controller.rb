module FormFields
  class StoreBooksController < ApplicationController
    def new
      store = Store.new
      store.books.build

      helpers.form_for(store) do |form|
        form.fields_for :books, child_index: params[:index] do |book_form|
          render partial: "stores/book_fields", locals: { book_form: book_form }
        end
      end
    end

    private

    def new_params
      params.permit(:index)
    end
  end
end
