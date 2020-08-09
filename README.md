# rss-discord

A Bash project to parse a RSS feed and send it to Discord Webhook

## Installation

- Clone this repo and install it anywhere.
- Create an `output` and a `log` folder
- Copy the template of the default file (Create the `default.sh`) and add your default values

## Running

You can test the script by running it directly like so
```Bash
./rss.sh url="" file="" discord=""
```
Otherwise, use it with crontab (crontab -e)
```bash
* * * * * bash full/path/to/rss.sh url="" file="" discord=""
```

### All options
#### Required
| Option  | Description             |
| ------- | ----------------------- |
| url     | The url of the RSS feed |
| file    | The output file name    |
| discord | The Discord Webhook url |

#### Optional (For Discord Webhook Rich Embed with no content)
The script will use the default values in the `default.sh` file if nothing is given

| Option           | Description                                             |
| ---------------- | ------------------------------------------------------- |
| feed_title       | The title                                               |
| feed_description | The description                                         |
| color            | The color to show on the left (Seems not to work on PC) |
| author_name      | The name to display                                     |
| author_url       | The url of the author                                   |
| author_icon      | The icon of the author                                  |
| footer_title     | The message of the footer                               |
| footer_icon      | The icon of the footer                                  |
| field            | The field title (the body is the link)                  |
