# lita-rageface
[![Build Status](https://travis-ci.org/lpm11/lita-rageface.png?branch=master)](https://travis-ci.org/lpm11/lita-rageface)

Instant access to your favorite rage faces from Lita.

Powered by [All The Rage Faces API](http://alltheragefaces.com/api).

## Installation
Add lita-rageface to your Lita instance's Gemfile:

```ruby
gem "lita-rageface"
```

## Configuration (optional)
- `sort_key` (Symbol) - Possible values are `:views`, `:weekly_views`. Default: `:views`
- `image_key` (Symbol) - Possible values are `:png`, `:largepng`, `:jpg`, `:svg`. Default: `:png`

## Usage
```
You: rage super rage
Lita: http://cdn.alltheragefaces.com/img/faces/png/rage-super-rage.png
```

## License
[WTFPL](http://www.wtfpl.net/about/)
