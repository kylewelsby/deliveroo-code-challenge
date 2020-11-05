# Deliveroo - Code Challenge
[Deliveroo]() code challenge completed by [Kyle Welsby]()

The code challenge tasks are within [CHALLENGE.md](./CHALLENGE.md)

## ⚡️ System Dependencies

This project requires Ruby 2 to run.

_At time of writing the latest stable version of Ruby is 2.7.2_

## 🎲 Installation

Currently theres no external dependencies, so no requirement to install anything other than Ruby that is already assumed on your system

```
git clone https://github.com/kylewelsby/deliveroo-code-challenge.git
```

## 🎯 Usage

```
ruby ./parser.rb "*/15 0 1,15 * 1-5 /usr/bin/find"
```

Output
```
minute        0 15 30 45
hour          0
day of month  1 15
month         1 2 3 4 5 6 7 8 9 10 11 12
day of week   1 2 3 4 5
command       /usr/bin/find
```

## 🤖 Testing

```
ruby test/parser_test.rb
```

## 🚨 Linting

This project assumes you have [`standardrb`](https://github.com/testdouble/standard) installed globally.

```
standardrb .
```

## 🎓 License

MIT: https://kylewelsby.mit-license.org