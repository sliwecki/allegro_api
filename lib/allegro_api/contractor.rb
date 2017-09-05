class AllegroApi
  module Contractor

    #http://allegro.pl/webapi/documentation.php/show/id,1362
    def get_post_buy_forms_ids(params = {})
      page = params.fetch(:page, 0)
      per_page = params.fetch(:per_page, 100)
      execute(:do_get_post_buy_forms_ids, {
        sessionId: session.key,
        filterOptions: {
          item: [
            {
              filterId: 'search',
              filterValueId: { item: params.fetch(:search, nil) }
            }, {
              filterId: 'userLogin',
              filterValueId: { item: params.fetch(:buyer_login, nil) }
            }, {
              filterId: 'userRole',
              filterValueId: { item: params.fetch(:user_role, nil) }
            }, {
              filterId: 'shipmentId',
              filterValueId: { item: params.fetch(:delivery_method_id, nil) }
            }, {
              filterId: 'packageInfo',
              filterValueId: { item: params.fetch(:shipment_status, nil) }
            }, {
              filterId: 'paymentStatus',
              filterValueId: { item: params.fetch(:payment_status, nil) }
            }
          ].select { |item| item[:filterValueId][:item].present? }
        },
        resultSize: per_page,
        resultOffset: page*per_page
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
