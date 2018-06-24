# Uploaded Transactions Manager

This tool allows real estate agents to upload and manager their past real estate transactions.

## Tech
* Ruby 2.4.1
* Rails 5.1.4
* SQLite

## Setup
* Have the tech installed in the dev env
* Clone the repo locally
* Run `bundle install`
* Run `db:setup`
* Run `rails server`
* Navigate to `localhost:3000`

## Assignments (choose at least 2)
1. Build a bulk transaction uploader - allow agents to upload a CSV where each row represents a new transaction
  * Each column should represent the columns in the model
  * De-dupe on `address`, `zip` and `selling_date`
2. Add model and client-side validation and make the form sexier
   ###Attempted to use "dynamic_form" for form validation and cosmetic, but did not work 100%###
3. Paginate the transactions list on the agent profile page
   ###Paginate using Jquery datatable###
4. Sort the transactions list on the agent profile page by selling_date but sort transactions where the `property_type` is "land" or "mobile_home" at the bottom of the list
   ###Sorted by selling date DESC, append land + mobile home property type at bottom of list###
5. Build filtering and sorting controls to the transaction list on the agent profile
   ###Used Jquery datatable to enable sorting and filtering###
6. Optimize / speed up the `UploadedTransaction` queries - assume there are 10 million rows in that table
7. Allow the agent to select which side of the transaction they represented (seller, buyer or both)
8. Increase test coverage and add front-end testing
