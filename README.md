# README

This is simple rails web app, which shows how to wrap Threads for use ActiveRecord connections inside.

As we know, every thread, other than Rails Thread.current, must wrap AR queries inside ActiveRecord::Base.connection_pool.with_connection block.

Here is simple wrapper in `lib/ar_thread`.

```ruby
ARThread.start do
  @page = Page.first
  p @page.title if @page
end
```

## Run

```
bundle exec puma
```

## Test

```
ab -n 20 -c 20 http://127.0.0.1:3000/pages
```

Enjoy!