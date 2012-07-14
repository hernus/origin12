Origin12::Application.routes.draw do

  resources :companies, except: [ :show, :destroy ] do
    collection { get :switch }
    # resources :projects, only: [ :index ]
  end

  resources :customers, except: [ :show, :destroy ] do
    resources :projects, except: [ :show ]
  end

  resources :teams, except: [ :show ]
  
  resources :employees, except: [ :show ]

  # To get a collection of projects for a customer

  resources :projects, only: [ :index ], constraints: { format: /json/ } do
    resources :schedule_rates, only: [ :index, :new, :create ]
  end

  resources :roster_dates, :controller => 'roster_dates'

  # To duplication a week of roster dates

  get  'roster_dates/:duplicate_date/copy' \
      => 'roster_dates#copy',
      as: 'copy_roster_date'

  post 'roster_dates/duplicate' \
      => 'roster_dates#duplicate',
      as: 'copy_roster_dates'

  # Human-readable shortcut to RosterDate resources

  get 'roster' => 'roster_dates#index'

  root :to => 'roster_dates#index'

end
