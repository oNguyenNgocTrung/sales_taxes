# sales_taxes

## 1. Prerequisites

- Ruby 3.0.3(https://www.ruby-lang.org/en/documentation/installation/)
- Bundler

## 2. Installing

- Checkout and install dependencies:

```
git@github.com:oNguyenNgocTrung/sales_taxes.git
cd sales_taxes
bundle install
```

## 3. Running output

**3.a To run examples for output csv:**

input_1
```
bundle exec rake sales_taxes ./data/input/input_1.csv csv
```

input_2
```
bundle exec rake sales_taxes ./data/input/input_2.csv csv
```

input_3
```
bundle exec rake sales_taxes ./data/input/input_3.csv csv
```

The output file will be exported at `data/output/`

**3.b To run examples for printing output on the console:**

```
bundle exec rake sales_taxes ./data/input/input_1.csv
```

## 4. Testing

To run test suite

```
bundle exec rspec spec
```
