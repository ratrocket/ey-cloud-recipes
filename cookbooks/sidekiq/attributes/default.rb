#
# Cookbook Name:: sidekiq
# Attrbutes:: default
#

default[:sidekiq] = {
  # Sidekiq will be installed on to application/solo instances,
  # unless a utility name is set, in which case, Sidekiq will
  # only be installed on to a utility instance that matches
  # the name
  #:utility_name => 'sidekiq',
  :utility_name => nil,

  # Number of workers (not threads)
  :workers => 1,
  
  # Concurrency
  # NOTE In development we have the postgres pool set at 25 and setting
  # the sidekiq concurrency to 25 causes problems.  To fix that I set
  # the sidekiq concurrency to 15 & that seemed to run smooth.  But it
  # looks like in production, the EY-written database.yml doesn't even
  # have a "pool" setting, so I'm not sure if we should lower this or
  # what?  I guess we'll try 25 and see what happens.
  :concurrency => 25,

  # Queues
  :queues => {
    # :queue_name => priority
    :default => 1,
    :paperclip => 5,
  },

  # Verbose
  :verbose => false
}
