module AllegroApi
  module Contractor

    #http://allegro.pl/webapi/documentation.php/show/id,1362
    def get_post_buy_forms_ids(params = {})
      execute(:do_get_post_buy_forms_ids, {
        sessionId: session.key,
        filterOptions: {
          item: [
            filterId: 'userRole',
            filterValueId: { item: ['seller'] }
          ]
        },
        resultSize: params.fetch(:per_page, 100),
        resultOffset: params.fetch(:page, 0)
      })
    end

    #http://allegro.pl/webapi/documentation.php/show/id,703
    def get_post_buy_forms_data_for_sellers(params = {})
      execute(:do_get_post_buy_forms_data_for_sellers, {
        sessionId: session.key,
        transactionsIdsArray: {item: params.fetch(:transaction_ids) }
       }
      )[:post_buy_form_data][:item]
    end
  end
end
