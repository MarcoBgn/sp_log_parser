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
$ bundle exec rspec 
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

The output will be:

```
------------------------
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
------------------------
------------------------
/index 23 unique visits
/home 23 unique visits
/contact 23 unique visits
/help_page/1 23 unique visits
/about/2 22 unique visits
/about 21 unique visits
------------------------
```

## Assumptions

- Give the relatively small time window, some assumptions have been made:
  - The file is correctly formatted
  - The paths visited are only one level deep, as the ones present in the file
	  (i.e: no validation for /pages/1/tags/3) 
  - The input is manageable in-memory
  

## Trade offs

  - I kept the 2 methods in the presenter separated in the public interface:
    - for more granular testing
    - to allow to be used separately

## Next steps

- Give more time, the code could be improved to provide: 
  - file validation (i.e: checking the file size before processing and splitting the file if needed)
  - Introducing a `Visit` object, to manage large collections
  - output as a csv file
  - output as json (as part of a Gem) to be served in an API response
