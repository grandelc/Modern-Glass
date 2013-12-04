ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # Display the latest 5 orders placed on the site.
    section "Recent Orders" do
      table_for Order.order("created_at desc").limit(5) do
        column :id
        column :order_total
        column :created_at
        column :order_status
        column :customer_id
      end
      strong { link_to "View All Orders", admin_orders_path }
    end

    # Display the latest 5 customers registered on the site.
    section "New Customers" do
      table_for Customer.order("created_at desc").limit(5) do
        column :first_name
        column :last_name
        column :email
        column :addres
        column :city
        column :province
      end
      strong { link_to "View All Customers", admin_customers_path }
    end
  end # content
end
