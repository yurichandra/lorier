class Status < ApplicationRecord
  STATUSES = {
    'On Process': 1,
    'Received at Sorting Center': 2,
    'Received at Warehouse': 3,
    'With Delivery Courier': 4,
    'Delivered': 5
  }.freeze
end
