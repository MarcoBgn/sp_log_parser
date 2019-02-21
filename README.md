# Smart Pension - tech exercise

## Setup and tests

The script requires:
- Ruby 2.5.3
- bundler

Before run:
```bash
$ bundle
```

To run the specs run
```bash
$ bundle exec rspec spec/
```

To run Rubocop run:
```bash
$ bundle exec rubocop
```

## The script

To run the script:
```bash
$ ruby ./parser webserver.log
```

## Assumptions

- Give the relatively small time window, some assumptions have been made:
  - The file is correctly formatted
  - The paths visited are ony one level deep, as the ones present in the file
	  (i.e: no validation for /pages/1/tags/3) 
  - The input is manageable in-memory


## Next steps

- Give more time, the code could be improved to provide: 
  - file validation (i.e: checking the file size before processing and splitting the file if needed)
  - output as a csv file
  - output as json to be served as part of an API response
