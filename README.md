## Adds several methods which help to build conditions around value presence.

[![Gem Version](https://badge.fury.io/rb/arel-is-blank.svg)](https://badge.fury.io/rb/arel-is-blank)
[![Build Status](https://travis-ci.org/yivo/arel-is-blank.svg?branch=master)](https://travis-ci.org/yivo/arel-is-blank)

## About
`Àrel::Attributes::Attribute` receives several methods which help to build conditions around value presence.

## Usage
```ruby
# Get posts with detailed description.
t     = Post.arel_table
posts = Post.where(t[:detailed_description].is_not_blank)
# SELECT * FROM `posts` WHERE (`posts`.`detailed_description` IS NOT NULL AND `posts`.`detailed_description` <> '') 
```

## Installing gem
Add to your Gemfile:
```ruby
gem 'arel-is-blank', '~> 1.0'
```

## Running Tests
Install bundler:
```bash
gem install bundler
```

Install dependencies:
```bash
cd arel-is-blank && bundle
```

Run tests:
```bash
cd arel-is-blank && appraisal rake test
```
