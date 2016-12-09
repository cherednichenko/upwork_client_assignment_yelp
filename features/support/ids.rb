class IDs
  class << self;
    attr_accessor :buttons, :text_fields, :all_filters, :neighborhoods, :price, :pickup_check
    attr_accessor :search_result, :features, :category, :first_element_of_search_page
  end

  # -- Filters --
  @all_filters = '.filter-label.all-filters-toggle.show-tooltip'
  @neighborhoods = ".//*[@id='wrap']/div[3]/div[1]/div/div[2]/div/div[2]/div[2]/div[2]/ul[1]/li[2]/label/input"
  @price = ".//*[@id='wrap']/div[3]/div[1]/div/div[2]/div/div[2]/div[2]/div[4]/ul/li[3]/label/input"
  @features = ".//*[@id='wrap']/div[3]/div[1]/div/div[2]/div/div[2]/div[2]/div[5]/ul[1]/li[1]/label/input"
  @category = ".//*[@id='wrap']/div[3]/div[1]/div/div[2]/div/div[2]/div[2]/div[6]/ul/li[1]/label/input"
  @pickup_check = '.search-checkbox.js-platform-search-checkbox'

  # -- Search result label --
  @search_result = '.pagination-results-window'

  # -- Filtered page with articles --
  @first_element_of_search_page = '.biz-name.js-analytics-click>span'

  # -- Text boxes list --
  @text_fields = {
    'Find field' => 'find_desc',
    'Near field' => 'dropperText_Mast',
  }

  # -- Buttons list --
  @buttons = {
    'Search button' => 'header-search-submit',
  }
end
