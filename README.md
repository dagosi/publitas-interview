From: http://challenge.publitas.com/backend.html

# The Task
### Write a program that:

* Parses the product feed XML file above
* For each product, extracts the id, title and description
* Batches them together and calls the provided external service for each batch

### A batch should:

* Be a JSON encoded array of the form:
 ```
 [{id: 'id', title: 'title', description: 'description'}, ...]
 ```

* As close to as possible, but strictly below 5 megabytes in size

## Deliverables

Please provide a GitHub repo with your code containing a README on how to build and run your assignment. The preferred way would be something like:

```
bundle install
ruby assignment.rb
```
The code should be written in ruby (compatible with version 2.x)

## Extra Info

* The product feed format specification can be found here
* You can use any existing library you want (please don't write your own XML parser :))

## Running the program

```
bundle install
rake run_assignment
```
