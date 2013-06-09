# SongPrompter

Ever wondered how to easily present songs on slideshow? There's an app for that!

## Installing

1. Down the application.
2. Run `bundle`
3. Run `RAILS_ENV=production rake assets:precompile`
4. Run `RAILS_ENV=production rails s` or install it with your own favourite app handler.

## Adding songs

1. Click the Note Button on the top header.
2. Click the Add New Song Button.
3. Fill in the form.
4. Click the Save Button.

## Adding events (sets of songs)

1. Click the Event Button on the top header.
2. Click the Add New Event Button.
3. Fill in the form.
4. Click the Save Button.

## Tips & tricks

### Verses and chorus

The song text should look like this:

```
Text of chorus
And another line if you like
Notice the two hashes after separating chorus
##
Text of verse 1
With another
And another line

Text of verse 2
Notice the empty line
Between the verses
```

If you don't want a chorus just don't add it.